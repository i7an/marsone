require 'scanf'

module MarsOne
  module MissionParser

    class IOMissionReader
      InputFormatError = Class.new(StandardError)

      attr_accessor :io

      def initialize(io)
        self.io = io
      end

      def read_field
        match_data = io.readline.match(/^(\-?\d+)\s(\-?\d+)$/)
        raise InputFormatError.new unless match_data
        [match_data[1], match_data[2]].map(&:to_i)
      end

      def each_rover(&block)
        return enum_for(:each_rover) unless block_given?

        until io.eof?
          rover_match_data = io.readline.match(/^(\-?\d+)\s(\-?\d+)\s(N|W|E|S)$/)
          commands_match_data = io.readline.match(/^([A-Z]+)$/)
          raise InputFormatError.new unless rover_match_data && commands_match_data
          rover = [
            rover_match_data[1].to_i,
            rover_match_data[2].to_i,
            rover_match_data[3]
          ]

          yield rover, commands_match_data[1]
        end
      end
    end

  end
end
