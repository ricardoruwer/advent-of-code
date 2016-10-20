require_relative "coin"

lowest_with_five = Coin.new("ckczppom").get_lowest_number_starting_with("00000")
lowest_with_six = Coin.new("ckczppom").get_lowest_number_starting_with("000000")

puts "The lowest positive number using 5 zeros is:"
puts "R: #{lowest_with_five}"

puts "The lowest positive number using 6 zeros is:"
puts "R: #{lowest_with_six}"
