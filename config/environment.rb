# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.load_paths += %W( #{RAILS_ROOT}/lib/tasks )

  # Specify gems that this application depends on and have them installed with rake gems:install
   config.gem "jnunemaker-twitter", :lib => false,  :source => "http://gems.github.com"
  #config.gem "rizwanreza-twitter", :lib => false,  :source => "http://gems.github.com"
  config.gem "javan-whenever", :lib => false, :source => "http://gems.github.com"
  config.gem "less"
  
  config.time_zone = 'Riyadh'
end