require 'test/unit'
require_relative 'rucksack'

class RucksackTest < Test::Unit::TestCase
  def input
    <<~INPUT
      vJrwpWtwJgWrhcsFMMfFFhFp
      jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
      PmmdzqPrVvPwwTWBwg
      wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
      ttgJtRGJQctTZtZT
      CrZsJsPPZsGzwwsLwLmpwMDw
    INPUT
  end

  def test_simple
    total = Sleigh.new(input).total

    assert_equal(total, 157)
  end

  def test_complex
    total_sum_per_group = Sleigh.new(input).total_sum_per_group

    assert_equal(total_sum_per_group, 70)
  end
end
