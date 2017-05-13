require 'minitest/autorun'
require 'mars_one/mission_parser/io_mission_reader'

class IOMissionReaderTest < Minitest::Test
  def test_read_field
    io = StringIO.new('5 6')
    reader = MarsOne::MissionParser::IOMissionReader.new(io)
    x, y = reader.read_field
    assert_equal(5, x)
    assert_equal(6, y)
  end

  def test_read_rover
    io = StringIO.new("1 -2 E\nXXX")
    reader = MarsOne::MissionParser::IOMissionReader.new(io)
    (x, y, dir), commands = reader.each_rover.next

    assert_equal(1, x)
    assert_equal(-2, y)
    assert_equal(dir, 'E')
    assert_equal(commands, 'XXX')
  end

  def test_read_field_format
    io = StringIO.new('5, 6')
    reader = MarsOne::MissionParser::IOMissionReader.new(io)
    assert_raises(MarsOne::MissionParser::IOMissionReader::InputFormatError) do
      reader.read_field
    end
  end

  def test_rover_format
    io = StringIO.new("1 2 RR\nMMM")
    reader = MarsOne::MissionParser::IOMissionReader.new(io)
    assert_raises(MarsOne::MissionParser::IOMissionReader::InputFormatError) do
      reader.each_rover.next
    end
  end
end
