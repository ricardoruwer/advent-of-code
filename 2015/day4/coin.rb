require 'digest'

class Coin
  def initialize(input)
    @input = input
  end

  def get_lowest_number_starting_with(start)
    (1..Float::INFINITY).each do |num|
      string = Digest::MD5.hexdigest "#{@input}#{num}"
      return num if string.start_with?(start)
    end
  end
end
