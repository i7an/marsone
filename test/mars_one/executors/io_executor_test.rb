require 'minitest/autorun'
require 'mars_one/executors/io_executor'

class IOExecutorTest < Minitest::Test
  def test_execute
    io = StringIO.new <<IO
5 5
2 1 N
MRM
IO
    rover = MarsOne::Executors::IOExecutor.execute(io)[0]
    assert_equal(3, rover.position.x)
    assert_equal(2, rover.position.y)
    assert_equal(1, rover.direction.x)
    assert_equal(0, rover.direction.y)
  end
end
