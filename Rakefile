require 'rake/testtask'
require 'optparse'

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*test.rb']
end

task :mission, :input_file do |t, args|
  require 'mars_one/mission'
  require 'mars_one/mission_parser/io_mission_reader'

  File.open(args.input_file) do |file|
    reader = MarsOne::MissionParser::IOMissionReader.new(file)
    mission = MarsOne::Mission.new(reader)
    mission.execute.each do |rover|
      direction = MarsOne::MissionParser::Utils.point_to_direction(rover.direction)
      puts "#{rover.position.x} #{rover.position.y} #{direction}"
    end
  end
end
