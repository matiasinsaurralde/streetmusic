lock '3.2.1'

set :application, 'streetmusic'
set :repo_url, 'git@github.com:matiasinsaurralde/streetmusic.git'

set :deploy_to, '/var/www/streetmusic'
set :scm, :git
set :unicorn_conf, "#{deploy_to}/current/config/unicorn.rb"
set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"

set :rails_env, 'production'

set :user, 'streetmusic'
set :group, 'streetmusic'
set :runner, 'streetmusic'

# Default value for :format is :pretty
# set :format, :pretty
# Default value for :log_level is :debug
# set :log_level, :debug
# Default value for :pty is false
# set :pty, true
# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}
# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

set :keep_releases, 5

namespace :deploy do

  task :restart do
    on roles(:app) do
      execute "if [ -f #{fetch(:unicorn_pid)} ]; then kill -USR2 `cat #{fetch(:unicorn_pid)}`; else cd #{fetch(:deploy_to)}/current && bundle exec unicorn -c #{fetch(:unicorn_conf)} -E #{fetch(:rails_env)} -D; fi"
    end
  end
  task :start do
    on roles(:app) do
      execute "cd #{fetch(:deploy_to)}/current && bundle exec unicorn -c #{fetch(:unicorn_conf)} -E #{fetch(:rails_env)} -D"
    end
  end
  task :stop do
    on roles(:app) do
      execute "if [ -f #{fetch(:unicorn_pid)} ]; then kill -QUIT `cat #{fetch(:unicorn_pid)}`; fi"
    end
  end

  task :reset_db do
    on roles(:app) do
      execute "cd #{fetch(:deploy_to)}/current && bundle exec rake db:drop RAILS_ENV=#{fetch(:rails_env)}"
      execute "cd #{fetch(:deploy_to)}/current && bundle exec rake db:create RAILS_ENV=#{fetch(:rails_env)}"
      execute "cd #{fetch(:deploy_to)}/current && bundle exec rake db:migrate RAILS_ENV=#{fetch(:rails_env)}"
    end
  end

  #desc 'Restart application'
  #task :restart do
  #  on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
  #  end
  #end

  #after :publishing, :restart

  #after :restart, :clear_cache do
  #  on roles(:web), in: :groups, limit: 3, wait: 10 do
  #    # Here we can do anything such as:
  #    # within release_path do
  #    #   execute :rake, 'cache:clear'
  #    # end
  #  end
  #end
end
