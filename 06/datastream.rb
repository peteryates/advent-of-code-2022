class Datastream
  attr_reader :buffer

  def initialize(buffer)
    @buffer = buffer.chars
  end

  def start_of_packet_marker(width:)
    buffer.each_cons(width).with_index(1) do |c, i|
      return i + (width - 1) if c.uniq.size == width
    end
  end
end
