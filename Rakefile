gem 'rspec'
require 'rspec/core/rake_task'



RSpec::Core::RakeTask.new(:spec) do |t|
  t.fail_on_error = false

  t.rspec_opts = ["--format documentation", "--color", "--order=default"]
  t.pattern = ARGV[0] || "spec/game_spec.rb"
end

task :default => :spec
