default_run_options[:pty] = true

ssh_options[:auth_methods] = %w{publickey password} #jdl
ssh_options[:forward_agent] = true

require 'bundler'
require 'bundler/capistrano'
set :bundle_without,  [:development, :test]

set :repository,  "git://github.com/LRDesign/mizugumo_demo.git"
set :scm, 'git'
set :scm_verbose, true
set :git_enable_submodules, 1

# These two should speed up deployments by preventing a full clone from
# github.  However, in practice I've found they often cause problems; we can
# try turning them back on once the server is up and stable. - Evan
# set :deploy_via, :remote_cache
# set :git_shallow_clone, 1


set :runner, 'lrd'
set :user, 'lrd'

#TODO - switch to the domain once it resolves
set :domain, 'mizugumo-demo.lrdesign.com'

set :application, 'mizugumo-demo.lrdesign.com'
set :deploy_to, "/home/#{user}/#{domain}"
set :keep_releases, 10
set :branch, 'master'

set :rails_env, "production"
set :use_sudo, false

role(:app) { domain }
role(:web) { domain }
role(:db, :primary => true) { domain }

namespace :deploy do
  task :link_shared_files do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  task :update_git_submodules do
    run "cd #{release_path}; git submodule init; git submodule update"
  end

  task :submodules_and_links, :roles => [:app] do
    update_git_submodules
    link_shared_files
  end

  desc "Recycle the database"
  task :db_install do
     run("cd #{current_path}; /usr/bin/rake db:install RAILS_ENV=#{rails_env}")
  end
end

namespace :sample_data do
  task :reload, :roles => :app do
    run "cd #{current_path} && rake db:migrate:reset RAILS_ENV=production"
    run "cd #{current_path} && rake db:sample_data:load RAILS_ENV=production "
  end
end

namespace :gems do
  desc "Install gems"
  task :install, :roles => :app do
    run "cd #{current_path} && #{sudo} rake RAILS_ENV=production gems:install"
  end
end

after 'deploy:update_code', 'deploy:submodules_and_links'
