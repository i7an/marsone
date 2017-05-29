require 'minitest/autorun'
require 'mars_one/errors'
require 'mars_one/mission'
require 'mars_one/models/point'
require 'mars_one/models/rover'

class MissionTest < Minitest::Test
  def build_rovers_enum(data)
    return enum_for(:build_rovers_enum, data) unless block_given?
    data.each do |(rover, commands)|
      yield rover, commands
    end
  end

  def build_rover(x, y)
    MarsOne::Models::Rover.new(
      MarsOne::Models::Point.new(x, y),
      MarsOne::Models::Point.new(0, 1)
    )
  end

  def build_reader(rovers_data)
    reader = MiniTest::Mock.new
    reader.expect(:read_field, [5, 5])
    reader.expect(:each_rover, build_rovers_enum(rovers_data))
  end

  def test_execute
    reader = build_reader([
      [[1, 1, 'N'], 'M']
    ])

    rover = build_rover(1, 1)

    rover_factory = MiniTest::Mock.new
    rover_factory.expect(:rover, rover, [1, 1, 'N'])

    command = MiniTest::Mock.new
    command.expect(:execute, nil, [rover])

    command_factory = MiniTest::Mock.new
    command_factory.expect(:command, command, ['M'])

    mission = MarsOne::Mission.new(reader, rover_factory, command_factory)
    result = mission.execute

    assert_same(rover, result[0])
    assert command.verify
    assert reader.verify
    assert rover_factory.verify
    assert command_factory.verify
  end

  def test_forbidden_points
    reader = build_reader([
      [[1, 1, 'N'], 'M'],
      [[1, 1, 'S'], 'M']
    ])

    rover = build_rover(1, 1)
    rover2 = build_rover(1, 1)

    rover_factory = MiniTest::Mock.new
    rover_factory.expect(:rover, rover, [1, 1, 'N'])
    rover_factory.expect(:rover, rover2, [1, 1, 'S'])

    command = MiniTest::Mock.new
    command.expect(:execute, nil, [rover])

    command_factory = MiniTest::Mock.new
    command_factory.expect(:command, command, ['M'])

    mission = MarsOne::Mission.new(reader, rover_factory, command_factory)

    assert_raises(MarsOne::InvalidLocationError) do
      mission.execute
    end
  end
end
