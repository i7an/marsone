module MarsOne

  class Rover
    attr_accessor :position, :direction

    def initialize(position, direction = Math::Point.new(0, 1))
      self.position = position
      self.direction = direction
    end
  end

end
