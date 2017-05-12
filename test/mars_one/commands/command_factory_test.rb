require 'minitest/autorun'
require 'mars_one/commands/command_factory'

class CommandFactoryTest < Minitest::Test
  def test_m_input
    command = MarsOne::Commands::CommandFactory.command('M')
    assert_kind_of(MarsOne::Commands::MoveCommand, command)
  end

  def test_r_input
    command = MarsOne::Commands::CommandFactory.command('R')
    assert_kind_of(MarsOne::Commands::TurnRightCommand, command)
  end

  def test_l_input
    command = MarsOne::Commands::CommandFactory.command('L')
    assert_kind_of(MarsOne::Commands::TurnLeftCommand, command)
  end

  def test_unexpected_input
    assert_raises(MarsOne::Commands::CommandFactory::UnexpectedCommandError) do
      MarsOne::Commands::CommandFactory.command('O')
    end
  end

  def test_cache
    comand = MarsOne::Commands::CommandFactory.command('L')
    comand2 = MarsOne::Commands::CommandFactory.command('L')
    assert_same(comand, comand2)
  end
end
