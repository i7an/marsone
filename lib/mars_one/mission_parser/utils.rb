require 'mars_one/models/point'

module MarsOne
  module MissionParser

    module Utils
      def self.direction_to_point(direction)
        directions_points.find { |(dir, _point)| dir == direction }[1]
      end

      def self.point_to_direction(point)
        directions_points.find { |(_dir, p)| p == point }[0]
      end

      def self.directions_points
        [
          ['N', Models::Point.new(0, 1)],
          ['S', Models::Point.new(0, -1)],
          ['W', Models::Point.new(-1, 0)],
          ['E', Models::Point.new(1, 0)],
        ]
      end
    end

  end
end
