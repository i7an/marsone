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
      field = build_field(mission_reader.read_field)

      mission_reader.each_rover.map do |(x, y, direction), commands|
        rover = build_rover(x, y, direction)
        
        field.validate!(rover.position)

        commands.each_char do |command_char|
          apply_command(rover, command_char)
          field.validate!(rover.position)
        end

        field.forbid(rover.position)

        rover
      end
    end

    private

    attr_accessor :mission_reader

    def build_field(field_data)
      field_max_x, field_max_y = field_data
      MarsOne::Models::Field.new(field_max_x, field_max_y)
    end

    def build_rover(x, y, dir)
      direction = MarsOne::MissionParser::Utils.direction_to_point(dir)
      position = MarsOne::Models::Point.new(x, y)
      MarsOne::Models::Rover.new(position, direction)
    end

    def apply_command(rover, command_char)
      command = MarsOne::MissionParser::CommandFactory.command(command_char)
      command.execute(rover)
    end
  end

end
