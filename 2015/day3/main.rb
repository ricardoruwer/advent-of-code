require_relative 'map'

input = File.read("input.txt")
map = Map.new input

puts "How many houses receive at least one present?"
puts "R: #{map.count_houses_with_presents}"

puts "This year, how many houses receive at least one present?"
puts "R: #{map.count_houses_with_presents_using_robo_santa}"
