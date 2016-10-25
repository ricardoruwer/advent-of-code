require_relative "circuit"

input = File.read("input.txt")
circuit = Circuit.new(input)

puts "What signal is ultimately provided to wire a?"
puts "R: #{circuit.signal_of("a")}"

puts "What new signal is ultimately provided to wire a?"
puts "R: #{circuit.result_of_part_two}"
