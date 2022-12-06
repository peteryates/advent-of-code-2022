require 'pry-byebug'
require 'test/unit'
require_relative 'datastream'

class DatastreamTest < Test::Unit::TestCase
  def test_simple1
    assert_equal(Datastream.new("bvwbjplbgvbhsrlpgdmjqwftvncz").start_of_packet_marker(width: 4), 5)
  end

  def test_simple2
    assert_equal(Datastream.new("nppdvjthqldpwncqszvftbrmjlhg").start_of_packet_marker(width: 4), 6)
  end

  def test_simple3
    assert_equal(Datastream.new("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg").start_of_packet_marker(width: 4), 10)
  end

  def test_simple4
    assert_equal(Datastream.new("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw").start_of_packet_marker(width: 4), 11)
  end

  def test_complex1
    assert_equal(Datastream.new("mjqjpqmgbljsphdztnvjfqwrcgsmlb").start_of_packet_marker(width: 14), 19)
  end

  def test_complex2
    assert_equal(Datastream.new("bvwbjplbgvbhsrlpgdmjqwftvncz").start_of_packet_marker(width: 14), 23)
  end

  def test_complex3
    assert_equal(Datastream.new("nppdvjthqldpwncqszvftbrmjlhg").start_of_packet_marker(width: 14), 23)
  end

  def test_complex4
    assert_equal(Datastream.new("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg").start_of_packet_marker(width: 14), 29)
  end

  def test_complex5
    assert_equal(Datastream.new("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw").start_of_packet_marker(width: 14), 26)
  end
end
