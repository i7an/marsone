require 'minitest/autorun'
require 'mars_one/commands/turn_right_command'
require_relative './commands_test_helper'

class TurnRightCommandTest < Minitest::Test
  def test_turn_left
    command = MarsOne::Commands::TurnRightCommand.new
    rover = build_rover([0, 0], [0, 1])
    command.execute(rover)

    assert_equal 1, rover.direction.x
    assert_equal 0, rover.direction.y
  end
end
