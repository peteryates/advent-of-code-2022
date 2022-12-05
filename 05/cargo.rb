class Cargo
  attr_reader :stacks, :moves

  def initialize(stacks, moves)
    @stacks = stacks
    @moves = parse(moves)
  end

  def play_moves(mode:)
    if mode == :single
      move_crates_one_at_a_time
    else
      move_crates_many_at_a_time
    end
  end

  def top_crates_per_stack
    stacks.map { |_i, c| c.last }
  end

private

  def parse(moves)
    regexp = /move (?<count>\d+) from (?<from>\d+) to (?<to>\d+)/

    moves
      .split("\n")
      .map { |description| description.match(regexp) }
      .map { |md| { from: md[:from].to_i, to: md[:to].to_i, count: md[:count].to_i } }
  end

  def move_crates_one_at_a_time
    moves.each do |m|
      m.fetch(:count).times do
        stacks[m.fetch(:to)].push(stacks[m.fetch(:from)].pop)
      end
    end
  end

  def move_crates_many_at_a_time
    moves.each do |m|
      stacks[m.fetch(:to)].push(*stacks[m.fetch(:from)].pop(m.fetch(:count)))
    end
  end
end
