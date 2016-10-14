gem "minitest"
require "minitest/autorun"
require_relative "santa"

class SantaTest < MiniTest::Test
  def test_moves_santa_up
    assert_equal 1, Santa.new("(").current_floor
  end

  def test_moves_santa_down
    assert_equal -1, Santa.new(")").current_floor
  end

  def test_moves_santa_multiple_times
    assert_equal 3, Santa.new("(()(()(()").current_floor
  end

  def test_position_when_entering_basement
    assert_equal 5, Santa.new("(()))").first_enter_basement
  end
end
