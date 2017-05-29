require 'mars_one/mission'
require 'mars_one/mission_parser/io_mission_reader'
require 'mars_one/mission_parser/command_factory'
require 'mars_one/mission_parser/rover_factory'

module MarsOne
  module Executors

    module IOExecutor
      def self.execute(io)
        reader = MarsOne::MissionParser::IOMissionReader.new(io)
        command_factory = MarsOne::MissionParser::CommandFactory.new
        rover_factory = MarsOne::MissionParser::RoverFactory.new
        mission = MarsOne::Mission.new(reader, rover_factory, command_factory)
        mission.execute
      end
    end

  end
end
