require_relative "box"

input = File.read("input.txt")
boxes = Box.new input

puts "How many total square feet of wrapping paper should they order?"
puts "R: #{boxes.paper_to_order}"

puts "How many total feet of ribbon should they order?"
puts "R: #{boxes.ribbon_to_order}"
