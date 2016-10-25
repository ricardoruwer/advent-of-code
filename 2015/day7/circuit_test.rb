gem "minitest"
require "minitest/autorun"
require_relative "circuit"

class CircuitTest < MiniTest::Test
  def setup
    @circuit = Circuit.new("123 -> x\n456 -> y\nx AND y -> d\nx OR y -> e\nx LSHIFT 2 -> f\ny RSHIFT 2 -> g\nNOT x -> h\nNOT y -> i")
  end

  def test_wire_value
    assert_equal 123, @circuit.signal_of("x")
  end

  def test_and_operator
    assert_equal 72, @circuit.signal_of("d")
  end

  def test_or_operator
    assert_equal 507, @circuit.signal_of("e")
  end

  def test_lshift_operator
    assert_equal 492, @circuit.signal_of("f")
  end

  def test_rshift_operator
    assert_equal 114, @circuit.signal_of("g")
  end

  def test_not_operator
    assert_equal 65412, @circuit.signal_of("h")
  end
end
