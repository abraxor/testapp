set :application, "testapp"

set :user, "viralgraphftp"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :use_sudo, false
set :scm, :git
set :repository, "git://github.com/abraxor/testapp.git"
set :keep_releases, 5

set :rvm_ruby_string, "ruby-2.0.0-p0"
set :bundle_without, [:development]

server "fdr.viralgraph.com", :app, :web, :db, :primary => true

#before 'deploy:restart', 'deploy:migrate'
# Install RVM
before 'deploy', 'rvm:install_rvm'
# Install Ruby
before 'deploy', 'rvm:install_ruby'
# Or create gemset
#before 'deploy', 'rvm:create_gemset'
after 'deploy', 'deploy:cleanup'

require "rvm/capistrano"
require "bundler/capistrano"
#load 'deploy/assets'