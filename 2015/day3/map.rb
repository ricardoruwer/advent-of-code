require 'set'

class Map
  MOVE_UP = "^"
  MOVE_RIGHT = ">"
  MOVE_DOWN = "v"
  MOVE_LEFT = "<"

  def initialize(input)
    @input = input
  end

  def count_houses_with_presents
    @delivers = Set.new

    santa = @input.chars
    deliver_with(santa)

    @delivers.size
  end

  def count_houses_with_presents_using_robo_santa
    @delivers = Set.new

    santa = @input.chars.select.with_index { |_, i| i.even? }
    deliver_with(santa)

    robo_santa = @input.chars.select.with_index { |_, i| i.odd? }
    deliver_with(robo_santa)

    @delivers.size
  end

  private

  def deliver_with(moves)
    x = y = 0
    @delivers.add("#{x},#{y}")

    moves.each do |move|
      case move
      when MOVE_UP then y += 1
      when MOVE_RIGHT then x += 1
      when MOVE_DOWN then y -= 1
      when MOVE_LEFT then x -= 1
      end

      @delivers.add("#{x},#{y}")
    end
  end
end
