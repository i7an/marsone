require 'set'
require 'mars_one/errors'

module MarsOne
  module Models

    class Field
      def initialize(max_x, max_y)
        @max_x = max_x
        @max_y = max_y
        @forbidden_points = Set.new
      end

      def valid?(point)
        in_boundaries?(point) && !taken?(point)
      end

      def validate!(point)
        raise MarsOne::InvalidLocationError.new('Point is out of field') unless in_boundaries?(point)
        raise MarsOne::InvalidLocationError.new('Location is taken') if taken?(point)
      end

      def forbid(point)
        forbidden_points.add([point.x, point.y])
      end

      private

      attr_reader :max_x, :max_y, :forbidden_points

      def in_boundaries?(point)
        point.x <= max_x && point.y <= max_y &&
          point.x >=0 && point.y >= 0
      end

      def taken?(position)
        forbidden_points.include?([position.x, position.y])
      end
    end

  end
end
