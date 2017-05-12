require 'minitest/autorun'
require 'mars_one/rover/rover'

class RoverTest < Minitest::Test
  def test_fields
    rover = MarsOne::Rover.new(:position, :direction)
    assert_same(rover.position, :position)
    assert_same(rover.direction, :direction)
  end
end
