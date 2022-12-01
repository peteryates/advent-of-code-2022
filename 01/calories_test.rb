require 'test/unit'
require_relative 'calories'

class CaloriesTest < Test::Unit::TestCase
  def test_simple
    input = <<~EXAMPLE
      1000
      2000
      3000

      4000

      5000
      6000

      7000
      8000
      9000

      10000
    EXAMPLE

    c = Calories.new(input)

    assert_equal c.max_inventory_size(1), 24_000
    assert_equal c.max_inventory_size(3), 45_000
  end
end
