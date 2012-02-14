# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'tasks/rails'

require "cucumber/rake/task"

desc "Run features"
task :features do
  sh 'cucumber features --format pretty --format junit --out tmp/features --expand --tags ~@wip'
end

Spec::Rake::SpecTask.new("rspec:junit") do |t|
  format = 'JUnitFormatter'
  formatters   = File.expand_path(File.dirname(__FILE__) + "/lib/rspec-extra-formatters.rb")
  t.spec_opts = ["-r \"#{formatters}\"", "-f \"#{format}\"", '>  tmp/specs']
  t.rcov = true
  t.rcov_opts = ['--exclude', "spec,gems,lib/forgery,config"]
end


task :default => [:features]
