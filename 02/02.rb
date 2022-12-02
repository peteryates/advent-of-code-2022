# frozen_string_literal: true

require_relative 'rock_paper_scissors'

input = File.read('input.txt')

puts 'part 1:'
puts RockPaperScissors.new(input, part: 1).score

puts 'part 2:'
puts RockPaperScissors.new(input, part: 2).score
