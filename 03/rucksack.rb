class Sleigh
  attr_reader :rucksacks, :priorities

  def initialize(supplies)
    @rucksacks = supplies.each_line.map { |l| Rucksack.new(l.strip) }
    @priorities = [*("a".."z"), *("A".."Z")].each
                                            .with_index(1)
                                            .with_object({}) { |(l, i), h| h[l] = i }
  end

  def total
    priorities.values_at(*all_items_in_both_sections).sum
  end

  def total_sum_per_group
    priorities.values_at(*badges).sum
  end

private

  def all_items_in_both_sections
    rucksacks.map(&:items_in_both_sections).flatten
  end

  def badges
    rucksacks.each_slice(3).flat_map { |g| priorities.keys.intersection(*g.map(&:all)) }
  end
end

class Rucksack
  attr_reader :all, :first, :second

  def initialize(contents)
    @all = contents.chars
    @first, @second = *contents.chars.each_slice(contents.size / 2)
  end

  def items_in_both_sections
    first & second
  end
end
