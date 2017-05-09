require 'minitest/autorun'
require 'mars_one/commands/move_command'
require 'mars_one/math/point'
require 'mars_one/rover'

class TestPoint < Minitest::Test
  def test_move
    command = MarsOne::Commands::MoveCommand.new
    position = MarsOne::Math::Point.new(2, 2)
    direction = MarsOne::Math::Point.new(1, 0)
    rover = MarsOne::Rover.new(position, direction)
    command.execute(rover)

    assert_equal 3, rover.position.x
    assert_equal 2, rover.position.y
  end
end
