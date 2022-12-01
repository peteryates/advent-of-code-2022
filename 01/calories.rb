require 'pry'

class Calories
  class Inventory
    attr_reader :items

    def initialize(items)
      @items = items
    end

    def total
      items.sum
    end
  end

  attr_reader :inventories

  def initialize(input)
    @inventories = input
      .split("\n\n")
      .map { |snack_group| snack_group.split("\n").map(&:to_i) }
      .map { |snack_list| Inventory.new(snack_list) }
  end

  def biggest_inventory_size(n)
    inventories.sort_by(&:total).last(n).map(&:total).sum
  end

  def inspect
    @inventories
  end
end
