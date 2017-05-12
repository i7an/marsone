require 'minitest/autorun'
require 'mars_one/mission_parser/rover_factory'

class RoverFactoryTest < Minitest::Test
  def test_rover
    rover = MarsOne::MissionParser::RoverFactory.rover(1, 2, 'N')
    assert_equal(1, rover.position.x)
    assert_equal(2, rover.position.y)
    assert_equal(0, rover.direction.x)
    assert_equal(1, rover.direction.y)
  end

  def test_compass_letter_format
    assert_raises(MarsOne::MissionParser::RoverFactory::CompassLetterError) do
      MarsOne::MissionParser::RoverFactory.rover(1, 2, 'X')
    end
  end
end
