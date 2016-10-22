gem "minitest"
require "minitest/autorun"
require_relative "word"

class WordTest < MiniTest::Test
  def test_word_with_all_required_values_and_random_letters_using_old_rule
    assert_equal 1, Word.new("ugknbfddgicrmopn").count_nice_words_old_rule
  end

  def test_word_with_all_required_values_and_repeated_letters_using_old_rule
    assert_equal 1, Word.new("aaa").count_nice_words_old_rule
  end

  def test_naughty_word_with_no_double_letter_using_old_rule
    assert_equal 0, Word.new("jchzalrnumimnmhp").count_nice_words_old_rule
  end

  def test_naughty_word_with_prohibited_value_using_old_rule
    assert_equal 0, Word.new("haegwjzuvuyypxyu").count_nice_words_old_rule
  end

  def test_naughty_word_with_less_than_three_vowels_using_old_rule
    assert_equal 0, Word.new("dvszwmarrgswjxmb").count_nice_words_old_rule
  end

  def test_word_with_all_required_values_and_random_letters_using_new_rules
    assert_equal 1, Word.new("qjhvhtzxzqqjkmpb").count_nice_words_new_rule
  end

  def test_word_with_all_required_values_and_repeated_letters_using_new_rules
    assert_equal 1, Word.new("xxyxx").count_nice_words_new_rule
  end

  def test_naughty_word_with_no_repeated_letter_between
    assert_equal 0, Word.new("uurcxstgmygtbstg").count_nice_words_new_rule
  end

  def test_with_no_pair_that_appears_twice
    assert_equal 0, Word.new("ieodomkazucvgmuy").count_nice_words_new_rule
  end
end
