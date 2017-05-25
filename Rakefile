require 'rake/testtask'

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*test.rb']
end

task :mission, :input_file do |t, args|
  require 'mars_one/executors/io_executor'
  require 'mars_one/mission_parser/utils'

  File.open(args.input_file) do |file|
    MarsOne::Executors::IOExecutor.execute(file).each do |rover|
      direction = MarsOne::MissionParser::Utils.point_to_direction(rover.direction)
      puts "#{rover.position.x} #{rover.position.y} #{direction}"
    end
  end
end
