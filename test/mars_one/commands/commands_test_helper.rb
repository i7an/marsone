require 'mars_one/math/point'
require 'mars_one/rover'

def build_rover(position_coordinates, direction_coordinates)
  position = MarsOne::Math::Point.new(*position_coordinates)
  direction = MarsOne::Math::Point.new(*direction_coordinates)
  MarsOne::Rover.new(position, direction)
end
