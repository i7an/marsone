require 'matrix'

module MarsOne
  module Models

    class Point
      attr_accessor :x, :y

      def initialize(x, y)
        self.x = x
        self.y = y
      end

      def add(other)
        self.x += other.x
        self.y += other.y
      end

      def ==(other)
        x == other.x && y == other.y
      end

      def to_matrix
        Matrix[[x], [y]]
      end

      def apply_matrix(m2x2)
        amended = m2x2 * to_matrix
        self.x = amended[0, 0]
        self.y = amended[1, 0]
        self
      end
    end

  end
end
