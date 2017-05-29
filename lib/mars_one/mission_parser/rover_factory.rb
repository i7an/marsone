require 'mars_one/models/rover'
require 'mars_one/models/point'
require 'mars_one/mission_parser/utils'

module MarsOne
  module MissionParser

    class RoverFactory
      def rover(x, y, dir)
        direction = MarsOne::MissionParser::Utils.direction_to_point(dir)
        position = MarsOne::Models::Point.new(x, y)
        MarsOne::Models::Rover.new(position, direction)
      end
    end

  end
end
