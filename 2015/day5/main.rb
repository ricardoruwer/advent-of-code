require_relative "word"

input = File.read("input.txt")
nice_words_old_rule = Word.new(input).count_nice_words_old_rule
nice_words_new_rule = Word.new(input).count_nice_words_new_rule

puts "How many strings are nice?"
puts "R: #{nice_words_old_rule}"

puts "How many strings are nice under these new rules?"
puts "R: #{nice_words_new_rule}"
