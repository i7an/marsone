require 'singleton'
require 'mars_one/commands/move_command'
require 'mars_one/commands/turn_left_command'
require 'mars_one/commands/turn_right_command'

module MarsOne
  module MissionParser

    class CommandFactory
      include Singleton

      UnexpectedCommandError = Class.new(StandardError)

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
          'M' => Commands::MoveCommand.new,
          'R' => Commands::TurnRightCommand.new,
          'L' => Commands::TurnLeftCommand.new
        }
        cache.default_proc = self.method(:command_not_found)
        cache
      end

      def command_not_found(cache, command_name)
        raise UnexpectedCommandError.new("Command '#{command_name}' is not supported")
      end
    end

  end
end
