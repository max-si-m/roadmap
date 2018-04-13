# config valid only for current version of Capistrano
lock "3.7.1"

set :application, "roadmap"
set :repo_url, "git@github.com:max-si-m/roadmap.git"
set :branch, "master"

set :deploy_to, "/home/deployer/roadmap"
set :user, 'deployer'

append :linked_files, "config/database.yml", "config/secrets.yml", '.env'

append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord
