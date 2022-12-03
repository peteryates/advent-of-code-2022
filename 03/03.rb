require_relative 'rucksack'

input = File.read("input.txt")

puts "Part 1:"
puts Sleigh.new(input).total

puts "Part 2:"
puts Sleigh.new(input).total_sum_per_group
