require 'minitest/autorun'
require 'mars_one/mission'

class MissionTest < Minitest::Test
  class MissionReader
    def read_field
      [5, 5]
    end

    def each_rover
      yield [[1, 2, 'N'], 'LMLMLMLMM']
    end
  end

  def test_execute
    reader = MissionReader.new
    mission = MarsOne::Mission.new(reader)
    rover = mission.execute[0]

    assert_equal(1, rover.position.x)
    assert_equal(3, rover.position.y)

    assert_equal(0, rover.direction.x)
    assert_equal(1, rover.direction.y)
  end
end
