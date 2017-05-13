require 'set'

module MarsOne
  module Models

    class Field
      InvalidLocationError = Class.new(StandardError)

      def initialize(max_x, max_y)
        raise ArgumentError.new if max_x < 0 || max_y < 0
        @max_x = max_x
        @max_y = max_y
        @forbidden_points = Set.new
      end

      def valid?(point)
        point.x <= max_x && point.y <= max_y &&
          point.x >=0 && point.y >= 0 &&
          !forbidden_points.include?(point)
      end

      def validate!(point)
        raise InvalidLocationError.new unless valid?(point)
      end

      def forbid(point)
        forbidden_points.add(point)
      end

      private

      attr_reader :max_x, :max_y, :forbidden_points
    end

  end
end
