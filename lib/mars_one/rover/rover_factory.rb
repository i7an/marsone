require 'singleton'
require 'mars_one/rover/rover'
require 'mars_one/rover/point'

module MarsOne

  class RoverFactory
    include Singleton

    class UnexpectedCompassLetterError < StandardError
    end

    def self.rover(x, y, compass_letter)
      instance.rover(x, y, compass_letter)
    end

    def rover(x, y, compass_letter)
      position = Math::Point.new(x, y)
      Rover.new(position, direction(compass_letter))
    end

    def direction(compass_letter)
      case compass_letter
      when 'N'
        Math::Point.new(0, 1)
      when 'S'
        Math::Point.new(0, -1)
      when 'W'
        Math::Point.new(-1, 0)
      when 'E'
        Math::Point.new(1, 0)
      else
        raise UnexpectedCompassLetterError.new
    end
  end

end
