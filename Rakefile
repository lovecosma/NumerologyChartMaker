ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

desc "Prints Hello World"
task :hello do
  puts "Hello World!"
end

desc "Drops all databases"
task :drop_all do
  puts "dropping all databases..."
  system "rm db/development.sqlite && rm db/test.sqlite && rm db/schema.rb"
end

desc "Migrates both testing and development databases"
task :migrations do
  puts "migrating databases"
  system "rake db:migrate && rake db:migrate SINATRA_ENV=test"
  puts "seeding database..."
  system "rake db:seed"
  puts "done"
end

desc "Reset All"
task :reset_all do
  Rake::Task["drop_all"].execute
  Rake::Task["migrations"].execute
  system "shotgun"
end
