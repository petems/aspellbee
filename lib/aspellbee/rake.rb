task_path = File.expand_path('../../tasks', __FILE__)
Dir["#{task_path}/*.rake"].each do |rake_task_file|
  load rake_task_file
end
