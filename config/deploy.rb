# config valid for current version and patch releases of Capistrano
lock "~> 3.10.0"

set :application, "tax-time-rails"
set :repo_url, "https://github.com/joshgumerove/tax-time-rails"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/joshgumerove/hackathon-project/tax-time"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

#set :deploy_via, :remote_cache
set :copy_exclude, [ '.git' ]

set(:config_files, %w(nginx.conf))

set :linked_dirs, %w{ log }
append :linked_files, "config/master.key"

# puma
set :puma_preload_app, true
set :puma_init_active_record, true

namespace :puma do
  desc "Create dirs for puma pids and socket"
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc "Make sure local git is in sync with remote"
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/#{fetch(:branch)}`
        puts "WARNING: HEAD is not the same as origin/master"
        exit
      end
    end
  end

  desc "Initial deploy"
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  after :finishing, :cleanup
end