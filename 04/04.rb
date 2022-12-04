require_relative 'cleanup'

input = File.read('input.txt')

puts 'Part 1:'
puts Cleanup.new(input).pairs_with_superset

puts 'Part 2:'
puts Cleanup.new(input).pairs_with_overlap
