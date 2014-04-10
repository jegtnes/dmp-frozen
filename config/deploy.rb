set :application, 'ProjectBrunel'
set :repo_url, 'git@github.com:jegtnes/dmp.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/home/rails'
set :scm, :git
set :branch, "master"
set :user, "alex"
set :group, "deployers"
set :use_sudo, false
set :rails_env, "production"
set :copy_strategy, :checkout
set :deploy_via, :copy
set :ssh_options, { :forward_agent => true }
set :keep_releases, 5
set :tmp_dir, '/home/alex/tmp'
set :log_level, :debug
set :format, :pretty
set :rbenv_ruby, File.read('.ruby-version').strip
set :git_enable_submodules, 1

# set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :echo, "Restarting Unicorn…"
      execute :sudo, '/home/unicorn/restart.sh'
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'
  after :finishing, 'deploy:restart'

end
