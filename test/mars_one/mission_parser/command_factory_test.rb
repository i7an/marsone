require 'minitest/autorun'
require 'mars_one/errors'
require 'mars_one/mission_parser/command_factory'

class CommandFactoryTest < Minitest::Test
  def factory
    MarsOne::MissionParser::CommandFactory.new
  end

  def test_m_input
    command = factory.command('M')
    assert_kind_of(MarsOne::Commands::MoveCommand, command)
  end

  def test_r_input
    command = factory.command('R')
    assert_kind_of(MarsOne::Commands::TurnRightCommand, command)
  end

  def test_l_input
    command = factory.command('L')
    assert_kind_of(MarsOne::Commands::TurnLeftCommand, command)
  end

  def test_unexpected_input
    assert_raises(MarsOne::UnexpectedCommandError) do
      factory.command('O')
    end
  end

  def test_cache
    command_factory = factory
    comand = command_factory.command('L')
    comand2 = command_factory.command('L')
    assert_same(comand, comand2)
  end
end
