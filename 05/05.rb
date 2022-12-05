require_relative 'cargo'

# Ruby doesn't have a deep copy so Marshal it 🤷
STACKS = Marshal.dump(
  {
    1 => %w(P L M N W V B H),
    2 => %w(H Q M),
    3 => %w(L M Q F G B D N),
    4 => %w(G W M Q F T Z),
    5 => %w(P H T M),
    6 => %w(T G H D J M B C),
    7 => %w(R V F B N M),
    8 => %w(S G R M H L P),
    9 => %w(N C B D P),
  }.transform_values(&:reverse)
).freeze

moves = File.read("input.txt").split("\n\n").last

puts "Part 1:"
puts Cargo.new(Marshal.load(STACKS), moves).tap { |c| c.play_moves(mode: :single) }.top_crates_per_stack.join

puts "Part 2:"
puts Cargo.new(Marshal.load(STACKS), moves).tap { |c| c.play_moves(mode: :multiple) }.top_crates_per_stack.join
