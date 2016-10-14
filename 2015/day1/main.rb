require_relative "santa"

input = File.read("input.txt")
santa = Santa.new input

puts "To what floor do the instructions take Santa?"
puts "R: #{santa.current_floor}"

puts "What is the position of the character that causes Santa to first enter the basement?"
puts "R: #{santa.first_enter_basement}"
