class Word
  PROHIBITED_STRINGS = %w(ab cd pq xy)

  def initialize(input)
    @input = input
  end

  def count_nice_words_old_rule
    get_words.reduce(0) do |total, word|
      total += 1 if nice_using_old_rules?(word)
      total
    end
  end

  def count_nice_words_new_rule
    get_words.reduce(0) do |total, word|
      total += 1 if nice_using_new_rules?(word)
      total
    end
  end

  private

  def get_words
    @input.split("\n")
  end

  def nice_using_old_rules?(word)
    at_least_three_vowels?(word) && letters_appearing_twice?(word) && no_prohibited_strings?(word)
  end

  def nice_using_new_rules?(word)
    pair_of_letters_repeating?(word) && one_letter_between_two_equals?(word)
  end

  def at_least_three_vowels?(word)
    word =~ /(.*[aeiou]){3}/
  end

  def letters_appearing_twice?(word)
    word.match(/((.)\2+)/)
  end

  def no_prohibited_strings?(word)
    word.match(/#{PROHIBITED_STRINGS.join("|")}/).nil?
  end

  def pair_of_letters_repeating?(word)
    word.match(/(\w{2}).*?(\1)/)
  end

  def one_letter_between_two_equals?(word)
    word.match(/(.).\1/)
  end
end
