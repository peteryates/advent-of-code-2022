require_relative 'datastream'

input = File.read("input.txt")
datastream = Datastream.new(input)

puts "Part 1:"
puts datastream.start_of_packet_marker(width: 4)

puts "Part 2:"
puts datastream.start_of_packet_marker(width: 14)
