class Word
  PROHIBITED_STRINGS = ["ab", "cd", "pq", "xy"]

  def initialize(input)
    @input = input
  end

  def count_nice_words_old_rule
    total = 0
    get_words.each do |word|
      total += 1 if is_nice_using_old_rules(word)
    end

    total
  end

  def count_nice_words_new_rule
    total = 0
    get_words.each do |word|
      total += 1 if is_nice_using_new_rules(word)
    end

    total
  end

  private

  def get_words
    @input.split("\n")
  end

  def is_nice_using_old_rules(word)
    has_at_least_three_vowels(word) && has_letters_appearing_twice(word) && has_no_prohibited_strings(word)
  end

  def is_nice_using_new_rules(word)
    has_pair_of_letters_repeating(word) && has_one_letter_between_two_equals(word)
  end

  def has_at_least_three_vowels(word)
    word.scan(/[aeoui]/).count >= 3
  end

  def has_letters_appearing_twice(word)
    word.match(/((.)\2+)/)
  end

  def has_no_prohibited_strings(word)
    word.match(/#{PROHIBITED_STRINGS.join("|")}/).nil?
  end

  def has_pair_of_letters_repeating(word)
    word.match(/(\w{2}).*?(\1)/)
  end

  def has_one_letter_between_two_equals(word)
    word.match(/(.).\1/)
  end
end
