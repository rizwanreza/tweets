set :application, "sauditweets"
set :repository,  "git@github.com:rizwanreza/sauditweets.git"

set :port, 1111

set :rails_env, "production"

set :domain, 'sauditweets.com'
set :user, "deploy"
set :deploy_to, "~/#{application}"

set :scm, :git
set :deploy_via, :remote_cache

role :app, domain
role :web, domain
role :db,  domain, :primary => true

set :deploy_via, :remote_cache

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end

namespace :deploy do
  desc "Update the crontab file"
  task :update_crontab, :roles => :db do
    run "cd #{release_path} && whenever --update-crontab #{application}"
  end
end

after "deploy:symlink", "deploy:update_crontab"
