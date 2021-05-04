require 'rake'
require 'hanami/rake_tasks'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task default: :spec

  # task :seed do
  #   file = File.expand_path('./db/seed.rb', __dir__)

  #   if File.exist?(file)
  #     system "ruby #{file}"
  #     puts 'Done!'
  #   else
  #     puts "File db/#{File.basename(file)} does not exist"
  #   end
  # end
rescue LoadError
  # skip
end
