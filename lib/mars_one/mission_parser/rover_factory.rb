require 'singleton'
require 'mars_one/models/rover'
require 'mars_one/models/point'

module MarsOne
  module MissionParser

    class RoverFactory
      include Singleton

      class CompassLetterError < StandardError
      end

      def self.rover(x, y, compass_letter)
        instance.rover(x, y, compass_letter)
      end

      def rover(x, y, compass_letter)
        position = point(x, y)
        Models::Rover.new(position, direction(compass_letter))
      end

      def direction(compass_letter)
        case compass_letter
        when 'N'
          point(0, 1)
        when 'S'
          point(0, -1)
        when 'W'
          point(-1, 0)
        when 'E'
          point(1, 0)
        else
          raise CompassLetterError.new
        end
      end

      private

      def point(x, y)
        Models::Point.new(x, y)
      end
    end

  end
end
