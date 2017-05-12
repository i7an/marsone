require 'minitest/autorun'
require 'mars_one/models/field'

class FieldTest < Minitest::Test
  Point = Struct.new('Point', :x, :y)

  def test_validation
    field = MarsOne::Models::Field.new(5, 5)
    assert_equal(true, field.valid?(Point.new(0, 0)))
    assert_equal(true, field.valid?(Point.new(5, 5)))
    assert_equal(false, field.valid?(Point.new(-1, 0)))
    assert_equal(false, field.valid?(Point.new(6, 0)))
  end

  def test_validate
    field = MarsOne::Models::Field.new(5, 5)
    assert_raises(MarsOne::Models::Field::InvalidLocationError) do
      field.validate!(Point.new(6, 6))
    end
  end

  def test_forbid
    field = MarsOne::Models::Field.new(5, 5)
    field.forbid(Point.new(3, 3))
    assert_equal(false, field.valid?(Point.new(3, 3)))
  end

  def test_arguments
    assert_raises(ArgumentError) do
      MarsOne::Models::Field.new(-1, 1)
    end
  end
end
