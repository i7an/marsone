require 'minitest/autorun'
require 'mars_one/mission_parser/rover_factory'

class RoverFactoryTest < Minitest::Test
  def factory
    MarsOne::MissionParser::RoverFactory.new
  end

  def test_rover
    rover = factory.rover(1, 2, 'N')
    assert_equal(1, rover.position.x)
    assert_equal(2, rover.position.y)
    assert_equal(0, rover.direction.x)
    assert_equal(1, rover.direction.y)    
  end
end
