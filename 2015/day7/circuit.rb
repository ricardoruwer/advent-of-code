class Circuit
  def initialize(input)
    @input = input
    @wires = Hash.new
  end

  def signal_of(wire)
    get_circuits.each do |circuit|
      instruction, end_wire = circuit.split("->").map(&:strip)

      case instruction.split.count
      when 1
        set_bitwise_direct(end_wire, instruction)
      when 2
        value = instruction.split.last
        set_bitwise_not(end_wire, value)
      when 3
        value_l, operator, value_r = instruction.split.map(&:strip)

        value_l = number?(value_l) ? value_l.to_i : @wires[value_l]
        value_r = number?(value_r) ? value_r.to_i : @wires[value_r]

        if value_l && value_r
          case operator
          when "AND" then set_bitwise_and(end_wire, value_l, value_r)
          when "OR" then set_bitwise_or(end_wire, value_l, value_r)
          when "LSHIFT" then set_bitwise_lshift(end_wire, value_l, value_r)
          when "RSHIFT" then set_bitwise_rshift(end_wire, value_l, value_r)
          end
        end
      end
    end

    return @wires[wire] if @wires[wire]
    signal_of(wire)
  end

  def result_of_part_two
    wire_a = signal_of("a")

    @wires = Hash.new
    @wires["b"] = wire_a

    signal_of("a")
  end

  private

  def get_circuits
    @circuits ||= @input.split("\n")
  end

  def number?(value)
    value.match(/[0-9]+/)
  end

  def set_bitwise_direct(end_wire, instruction)
    unless @wires[end_wire]
      @wires[end_wire] = number?(instruction)? instruction.to_i : @wires[instruction]
    end
  end

  def set_bitwise_not(end_wire, value)
    @wires[end_wire] = 2**16 + ~@wires[value].to_i if @wires[value]
  end

  def set_bitwise_and(end_wire, value_l, value_r)
    @wires[end_wire] = value_l & value_r
  end

  def set_bitwise_or(end_wire, value_l, value_r)
    @wires[end_wire] = value_l | value_r
  end

  def set_bitwise_lshift(end_wire, value_l, value_r)
    @wires[end_wire] = value_l << value_r
  end

  def set_bitwise_rshift(end_wire, value_l, value_r)
    @wires[end_wire] = value_l >> value_r
  end
end
