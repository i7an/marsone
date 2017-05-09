require 'minitest/autorun'
require 'mars_one/commands/move_command'
require_relative './commands_test_helper'


class MoveCommandTest < Minitest::Test
  def test_move
    command = MarsOne::Commands::MoveCommand.new
    rover = build_rover([2, 2], [1, 0])
    command.execute(rover)

    assert_equal 3, rover.position.x
    assert_equal 2, rover.position.y
  end
end
