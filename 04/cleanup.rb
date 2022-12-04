require 'set'

class Cleanup
  attr_reader :pairs

  def initialize(input)
    @pairs = input
      .split("\n")
      .map { |l| l.split(",") }
      .map { |p| Pair.new(*p) }
  end

  def pairs_with_superset
    pairs.count(&:contains_superset?)
  end

  def pairs_with_overlap
    pairs.count(&:contains_overlap?)
  end

  class Pair
    attr_accessor :a, :b

    def initialize(a, b)
      @a = range_from_input(a)
      @b = range_from_input(b)
    end

    def contains_superset?
      a.superset?(b) || b.superset?(a)
    end

    def contains_overlap?
      a.intersect?(b)
    end

  private

    def range_from_input(input)
      bounds = input.split("-").map(&:to_i)

      (bounds[0]..bounds[1]).to_set
    end
  end
end
