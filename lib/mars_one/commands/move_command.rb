module MarsOne
  module Commands

    class MoveCommand
      def execute(rover)
        rover.position.add(rover.direction)
      end
    end

  end
end
