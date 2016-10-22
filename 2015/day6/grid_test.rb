gem "minitest"
require "minitest/autorun"
require_relative "grid"

class GridTest < MiniTest::Test
  def test_turn_on_some_lights
    assert_equal 500000, Grid.new("turn on 0,0 through 499,999").count_lights_on
  end

  def test_turn_off_some_lights
    assert_equal 999996, Grid.new("turn on 0,0 through 999,999\nturn off 998,998 through 999,999").count_lights_on
  end

  def test_toggle_some_lights_on
    assert_equal 1000, Grid.new("toggle 0,0 through 999,0").count_lights_on
  end

  def test_toggle_some_lights_off
    assert_equal 0, Grid.new("turn on 499,499 through 500,500\ntoggle 499,499 through 500,500").count_lights_on
  end

  def test_increase_brightness_by_one
    assert_equal 1, Grid.new("turn on 0,0 through 0,0").brightness
  end

  def test_decrease_brightness_by_one
    assert_equal 1, Grid.new("toggle 0,0 through 0,0\nturn off 0,0 through 0,0").brightness
  end
end
