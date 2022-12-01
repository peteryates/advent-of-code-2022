require_relative 'calories'

input = File.read("input.txt")

c = Calories.new(input)

puts "part 1:"
puts c.biggest_inventory_size(1)

puts "part 2:"
puts c.biggest_inventory_size(3)
