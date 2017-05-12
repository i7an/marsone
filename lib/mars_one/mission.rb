require 'mars_one/models/field'
require 'mars_one/mission_parser/rover_factory'
require 'mars_one/mission_parser/command_factory'

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
        rover = MarsOne::MissionParser::RoverFactory.rover(x, y, dir)
        commands.each_char do |command_letter|
          command = MarsOne::MissionParser::CommandFactory.command(command_letter)
          command.execute(rover)
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
