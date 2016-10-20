gem 'minitest'
require 'minitest/autorun'
require_relative 'map'

class MapTest < MiniTest::Test
  def test_delivers_presents_going_top
    assert_equal 2, Map.new("^").count_houses_with_presents
  end

  def test_delivers_presents_going_right
    assert_equal 2, Map.new(">").count_houses_with_presents
  end

  def test_delivers_presents_going_down
    assert_equal 2, Map.new("v").count_houses_with_presents
  end

  def test_delivers_presents_going_left
    assert_equal 2, Map.new("<").count_houses_with_presents
  end

  def test_delivers_presents_going_in_a_square
    assert_equal 4, Map.new("^>v<").count_houses_with_presents
  end

  def test_delivers_presents_going_up_and_down
    assert_equal 2, Map.new("^v^v^v^v^v").count_houses_with_presents
  end

  def test_delivers_presents_going_left_and_right
    assert_equal 2, Map.new("<><><><><>").count_houses_with_presents
  end

  def test_delivers_presents_going_top_with_robo_santa
    assert_equal 2, Map.new("^").count_houses_with_presents_using_robo_santa
  end

  def test_delivers_presents_going_right_with_robo_santa
    assert_equal 2, Map.new(">").count_houses_with_presents_using_robo_santa
  end

  def test_delivers_presents_going_down_with_robo_santa
    assert_equal 2, Map.new("v").count_houses_with_presents_using_robo_santa
  end

  def test_delivers_presents_going_left_with_robo_santa
    assert_equal 2, Map.new("<").count_houses_with_presents_using_robo_santa
  end

  def test_delivers_presents_going_in_a_square_with_robo_santa
    assert_equal 3, Map.new("^>v<").count_houses_with_presents_using_robo_santa
  end

  def test_delivers_presents_going_up_and_down_with_robo_santa
    assert_equal 11, Map.new("^v^v^v^v^v").count_houses_with_presents_using_robo_santa
  end

  def test_delivers_presents_going_left_and_right_with_robo_santa
    assert_equal 11, Map.new("<><><><><>").count_houses_with_presents_using_robo_santa
  end
end
