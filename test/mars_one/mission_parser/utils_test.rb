require 'minitest/autorun'
require 'mars_one/mission_parser/utils'

class UtilsTest < Minitest::Test
  def test_direction_to_point
    p = MarsOne::MissionParser::Utils.direction_to_point('N')
    assert_equal(point(0, 1), p)
  end

  def test_point_to_direction
    dir = MarsOne::MissionParser::Utils.point_to_direction(point(1, 0))
    assert_equal('E', dir)
  end

  def point(x, y)
    MarsOne::Models::Point.new(x, y)
  end
end
