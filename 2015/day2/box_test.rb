gem "minitest"
require "minitest/autorun"
require_relative "box"

class BoxTest < MiniTest::Test
  def test_calculate_paper_of_one_box
    assert_equal 58, Box.new("2x3x4").paper_to_order
  end

  def test_calculate_paper_of_multiple_boxes
    assert_equal 101, Box.new("2x3x4\n1x1x10").paper_to_order
  end

  def test_calculate_ribbon_of_one_box
    assert_equal 34, Box.new("2x3x4").ribbon_to_order
  end

  def test_calculate_ribbon_of_multiple_boxes
    assert_equal 48, Box.new("2x3x4\n1x1x10").ribbon_to_order
  end
end
