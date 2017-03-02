# config valid only for current version of Capistrano
lock "3.7.1"

set :application, "roadmap"
set :repo_url, "git@github.com:max-si-m/roadmap.git"
set :branch, "master"

set :deploy_to, "/home/deployer/roadmap"
set :user, 'deployer'

append :linked_files, "config/database.yml", '.env'

append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"
