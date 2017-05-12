require 'minitest/autorun'
require 'mars_one/mission_readers/io_mission_reader'

class IOMissionReaderTest < Minitest::Test
  def test_read_field
    io = StringIO.new('5 6')
    reader = MarsOne::MissionReaders::IOMissionReader.new(io)
    x, y = reader.read_field
    assert_equal(5, x)
    assert_equal(6, y)
  end

  def test_read_rover
    io = StringIO.new("1 2 N\nMMM")
    reader = MarsOne::MissionReaders::IOMissionReader.new(io)
    (x, y, dir), commands = reader.each_rover.next

    assert_equal(1, x)
    assert_equal(2, y)
    assert_equal(dir, 'N')
    assert_equal(commands, 'MMM')
  end
end
