require 'mars_one/mission'
require 'mars_one/mission_parser/io_mission_reader'

module MarsOne
  module Executors

    module IOExecutor
      def self.execute(io)
        reader = MarsOne::MissionParser::IOMissionReader.new(io)
        mission = MarsOne::Mission.new(reader)
        mission.execute
      end
    end

  end
end
