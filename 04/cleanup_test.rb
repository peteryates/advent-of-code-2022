require 'test/unit'
require_relative 'cleanup'

class CleanupTest < Test::Unit::TestCase
  def input
    <<~INPUT
      2-4,6-8
      2-3,4-5
      5-7,7-9
      2-8,3-7
      6-6,4-6
      2-6,4-8
    INPUT
  end

  def test_simple
    assert_equal(Cleanup.new(input).pairs_with_superset, 2)
  end

  def test_complex
    assert_equal(Cleanup.new(input).pairs_with_overlap, 4)
  end
end
