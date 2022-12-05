require 'pry-byebug'
require 'test/unit'
require_relative 'cargo'

class CargoTest < Test::Unit::TestCase
  def stacks
    {
      1 => %w(Z N),
      2 => %w(M C D),
      3 => %w(P),
    }
  end

  def moves
    <<~MOVES
      move 1 from 2 to 1
      move 3 from 1 to 3
      move 2 from 2 to 1
      move 1 from 1 to 2
    MOVES
  end

  def test_simple
    c = Cargo.new(stacks, moves)
    c.play_moves(mode: :single)

    assert_equal(c.top_crates_per_stack.join, "CMZ")
  end

  def test_complex
    c = Cargo.new(stacks, moves)
    c.play_moves(mode: :multiple)

    assert_equal(c.top_crates_per_stack.join, "MCD")
  end
end
