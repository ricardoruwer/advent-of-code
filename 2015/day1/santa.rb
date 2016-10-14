class Santa
  MOVE_UP = "("
  MOVE_DOWN = ")"
  BASEMENT = -1

  def initialize(input)
    @input = input
  end

  def current_floor
    moves_up_count - moves_down_count
  end

  def first_enter_basement
    floor = 0
    @input.chars.each_with_index do |move, index|
      case move
      when MOVE_UP
        floor += 1
      when MOVE_DOWN
        floor -= 1
      end

      return index + 1 if floor == BASEMENT
    end
  end

  private

  def moves_up_count
    @input.count MOVE_UP
  end

  def moves_down_count
    @input.count MOVE_DOWN
  end
end
