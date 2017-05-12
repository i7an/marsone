require 'mars_one/models/point'
require 'mars_one/models/rover'

def build_rover(position_coordinates, direction_coordinates)
  position = MarsOne::Models::Point.new(*position_coordinates)
  direction = MarsOne::Models::Point.new(*direction_coordinates)
  MarsOne::Models::Rover.new(position, direction)
end
