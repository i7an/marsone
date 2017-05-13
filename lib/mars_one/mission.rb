require 'mars_one/models/field'
require 'mars_one/models/rover'
require 'mars_one/models/point'
require 'mars_one/mission_parser/command_factory'
require 'mars_one/mission_parser/utils'

module MarsOne

  class Mission
    def initialize(mission_reader)
      self.mission_reader = mission_reader
    end

    def execute
      rovers = []

      field_max_x, field_max_y = mission_reader.read_field
      field = MarsOne::Models::Field.new(field_max_x, field_max_y)

      mission_reader.each_rover do |(x, y, dir), commands|
        direction = MarsOne::MissionParser::Utils.direction_to_point(dir)
        position = MarsOne::Models::Point.new(x, y)
        rover = MarsOne::Models::Rover.new(position, direction)
        field.validate!(rover.position)

        commands.each_char do |command_letter|
          command = MarsOne::MissionParser::CommandFactory.command(command_letter)
          command.execute(rover)
          field.validate!(rover.position)
        end

        field.forbid(rover.position)
        rovers.push(rover)
      end

      rovers
    end

    private

    attr_accessor :mission_reader
  end

end
