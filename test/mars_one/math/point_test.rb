require 'minitest/autorun'
require 'matrix'
require 'mars_one/math/point'

class TestPoint < Minitest::Test
  def test_initialization
    point = MarsOne::Math::Point.new(1, 2)
    assert_equal 1, point.x
    assert_equal 2, point.y
  end

  def test_apply_matrix
    point = MarsOne::Math::Point.new(1, 1)
    point.apply_matrix(Matrix[[0, -1], [-1, 0]])
    assert_equal -1, point.x
    assert_equal -1, point.y
  end

  def test_add
    point = MarsOne::Math::Point.new(1, 1)
    point2 = MarsOne::Math::Point.new(2, 3)
    point.add(point2)
    assert_equal 3, point.x
    assert_equal 4, point.y
  end
end
