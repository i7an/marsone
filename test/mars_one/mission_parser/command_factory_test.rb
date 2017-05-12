require 'minitest/autorun'
require 'mars_one/mission_parser/command_factory'

class CommandFactoryTest < Minitest::Test
  def test_m_input
    command = MarsOne::MissionParser::CommandFactory.command('M')
    assert_kind_of(MarsOne::Commands::MoveCommand, command)
  end

  def test_r_input
    command = MarsOne::MissionParser::CommandFactory.command('R')
    assert_kind_of(MarsOne::Commands::TurnRightCommand, command)
  end

  def test_l_input
    command = MarsOne::MissionParser::CommandFactory.command('L')
    assert_kind_of(MarsOne::Commands::TurnLeftCommand, command)
  end

  def test_unexpected_input
    assert_raises(MarsOne::MissionParser::CommandFactory::UnexpectedCommandError) do
      MarsOne::MissionParser::CommandFactory.command('O')
    end
  end

  def test_cache
    comand = MarsOne::MissionParser::CommandFactory.command('L')
    comand2 = MarsOne::MissionParser::CommandFactory.command('L')
    assert_same(comand, comand2)
  end
end
