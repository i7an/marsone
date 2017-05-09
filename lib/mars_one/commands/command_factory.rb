require 'singleton'
require 'move_command'
require 'turn_left_command'
require 'turn_right_command'
require 'unexpected_command'

module MarsOne
  module Commands

    class CommandFactory
      include Singleton

      def initialize
        @commands_cache = generate_commands_cache
      end

      def self.command(command_name)
        instance.command(command_name)
      end

      def command(command_name)
        @commands_cache[command_name]
      end

      private

      def generate_commands_cache
        cache = {
          'M' => MoveCommand.new
          'R' => TurnRightCommand.new
          'L' => TurnLeftCommand.new
        }
        cache.default_proc = self.method(:command_not_found)
        cache
      end

      def command_not_found(cache, command_name)
        UnexpectedCommand.new
      end
    end

  end
end