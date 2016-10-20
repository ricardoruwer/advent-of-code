gem "minitest"
require "minitest/autorun"
require_relative "coin"

class CoinTest < MiniTest::Test
  def test_get_lowest_number_starting_with_five_zeros
    assert_equal 609043, Coin.new("abcdef").get_lowest_number_starting_with("00000")
  end

  def test_get_lowest_number_starting_with_six_zeros
    assert_equal 5714438, Coin.new("pqrstuv").get_lowest_number_starting_with("000000")
  end
end
