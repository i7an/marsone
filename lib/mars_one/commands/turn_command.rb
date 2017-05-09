require 'matrix'

module MarsOne
  module Commands

    class TurnCommand
      def rotation_matrix
        Matrix.identity(2)
      end

      def execute(rover)
        rover.direction.apply_matrix(rotation_matrix)
      end
    end

  end
end
