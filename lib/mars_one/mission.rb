require 'mars_one/models/field'

module MarsOne

  class Mission
    attr_accessor :mission_reader, :rover_factory, :command_factory

    def initialize(mission_reader, rover_factory, command_factory)
      self.mission_reader = mission_reader
      self.rover_factory = rover_factory
      self.command_factory = command_factory
    end

    def execute
      field = build_field(mission_reader.read_field)

      mission_reader.each_rover.map do |(x, y, direction), commands|
        rover = rover_factory.rover(x, y, direction)

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

    def build_field(field_data)
      field_max_x, field_max_y = field_data
      MarsOne::Models::Field.new(field_max_x, field_max_y)
    end

    def apply_command(rover, command_char)
      command = command_factory.command(command_char)
      command.execute(rover)
    end
  end

end
