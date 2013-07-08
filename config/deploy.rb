require "rvm/capistrano"
require "bundler/capistrano"

default_run_options[:pty] = false
set :rvm_ruby_string, 'ruby-1.9.3-p125'
set :rvm_type, :user

set :environment, "production"
set :application, "mycollege.com"
set :scm, :git
set :repository, "git@github.com:manageyp/my_colleges.git"
set :branch, "master"

set :deploy_to, "/path/#{environment}/directory"
role :domain, application, :primary => true
role :web, application, :primary => true # Your HTTP server, Apache/etc
role :app, application, :primary => true # This may be the same as your `Web` server
role :db,  application, :primary => true # This is where Rails migrations will run

set :user, "user_name"        #proc { Capistrano::CLI.password_prompt("Server User: ") }
set :password, 'password'     #proc { Capistrano::CLI.password_prompt("Server Password : ") }
set :port, 5000 
set :use_sudo, false

# unicorn.rb 路径
set :unicorn_path, "#{deploy_to}/current/config/unicorn.rb"

namespace :deploy do
  task :start, :roles => :app do
    run "cd #{deploy_to}/current/; RAILS_ENV=production bundle exec unicorn_rails -c #{unicorn_path} -D"
  end

  task :stop, :roles => :app do
    run "kill -QUIT `cat #{deploy_to}/current/tmp/pids/unicorn.pid`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "kill -USR2 `cat #{deploy_to}/current/tmp/pids/unicorn.pid`"
  end
end