require 'test/unit'
require_relative 'rock_paper_scissors'

class RockPaperScissorsTest < Test::Unit::TestCase
  def test_simple
    input = <<~EXAMPLE
      A Y
      B X
      C Z
    EXAMPLE

    rps = RockPaperScissors.new(input)

    assert_equal rps.score, 15
  end

  def test_complex
    input = <<~EXAMPLE
      A Y
      B X
      C Z
    EXAMPLE

    rps = RockPaperScissors.new(input, part: 2)

    assert_equal rps.score, 12
  end
end
