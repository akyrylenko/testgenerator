# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require('ci/reporter/rake/rspec') if (ENV['RAILS_ENV']=='test' || ENV['RAILS_ENV']=='development')

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

if (ENV['RAILS_ENV']=='test' || ENV['RAILS_ENV']=='development')
  task :rspec => 'ci:setup:rspec'
end