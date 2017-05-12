module MarsOne
  module Models
    
    class Rover
      attr_accessor :position, :direction

      def initialize(position, direction)
        self.position = position
        self.direction = direction
      end
    end

  end
end
