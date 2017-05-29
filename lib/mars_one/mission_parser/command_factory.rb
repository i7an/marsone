require 'mars_one/errors'
require 'mars_one/commands/move_command'
require 'mars_one/commands/turn_left_command'
require 'mars_one/commands/turn_right_command'

module MarsOne
  module MissionParser

    class CommandFactory
      def initialize
        @commands_cache = generate_commands_cache
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
        cache.default_proc = method(:command_not_found)
        cache
      end

      def command_not_found(cache, command_name)
        raise MarsOne::UnexpectedCommandError.new("Command '#{command_name}' is not supported")
      end
    end

  end
end
