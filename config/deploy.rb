# config valid for current version and patch releases of Capistrano
lock "~> 3.15.0"

set :application, "kuesioner"
set :repo_url, "git@github.com:frullah/kuesioner.git"

# Default branch is :master
set :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/#{fetch(:application)}"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

append :linked_files, "config/master.key", ".env.production.local", "db/production.sqlite3"
append :linked_dirs,
  "log",
  "tmp/pids",
  "tmp/cache",
  "tmp/sockets",
  "node_modules",
  "bundle"

NODE_COMMAND_WRAPPER = <<~SHELL
  export PATH=/home/ubuntu/.fnm:$PATH
  eval "$(fnm env)"
  fnm use v14.15
SHELL

before "deploy:assets:precompile", "init_ssh_command" do
  SSHKit.config.command_map.prefix[:rake].unshift(NODE_COMMAND_WRAPPER)
end

Rake::Task["deploy:assets:backup_manifest"].clear_actions

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
