require 'minitest/autorun'
require 'mars_one/mission'

class MissionTest < Minitest::Test
  class MissionReader
    attr_accessor :rovers

    def initialize(rovers)
      self.rovers = rovers
    end

    def read_field
      [5, 5]
    end

    def each_rover(&block)
      rovers.each(&block)
    end
  end

  def test_execute
    reader = MissionReader.new([
      [[3, 3, 'E'], 'MMRMMRMRRM']
    ])
    mission = MarsOne::Mission.new(reader)
    rover = mission.execute[0]

    assert_equal(5, rover.position.x)
    assert_equal(1, rover.position.y)

    assert_equal(1, rover.direction.x)
    assert_equal(0, rover.direction.y)
  end

  def test_forbidden_points
    reader = MissionReader.new([
      [[0, 0, 'N'], 'M'],
      [[1, 1, 'W'], 'M']
    ])
    mission = MarsOne::Mission.new(reader)
    assert_raises(MarsOne::Models::Field::InvalidLocationError) do
      mission.execute
    end
  end
end
