require 'turn_command'

module MarsOne
  module Commands

    class TurnLeftCommand < TurnCommand
      def rotation_matrix
        Matrix[[0, -1], [1, 0]]
      end
    end

  end
end
