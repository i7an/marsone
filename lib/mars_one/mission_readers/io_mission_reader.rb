require 'scanf'

module MarsOne
  module MissionReaders

    class IOMissionReader
      attr_accessor :io

      def initialize(io)
        self.io = io
      end

      def read_field
        io.readline.scanf('%d %d')
      end

      def each_rover(&block)
        return enum_for(:each_rover) unless block_given?

        until io.eof?
          yield io.readline.scanf('%d %d %s'), io.readline
        end
      end
    end

  end
end
