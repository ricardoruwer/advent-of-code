require_relative "grid"

input = File.read("input.txt")
grid = Grid.new(input)

puts "How many lights are lit?"
puts "R: #{grid.count_lights_on}"

puts "What is the total brightness of all lights combined after following Santa's instructions?"
puts "R: #{grid.brightness}"
