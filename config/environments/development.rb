config.gem 'glennr-heroku_san', :lib => false

config.gem "rspec", :version => "1.3.0", :lib => false
config.gem "rspec-rails", :version => "1.3.2", :lib => false
config.gem "cucumber",         :lib => false, :version => "=0.8.3"
config.gem 'cucumber-rails',   :lib => false, :version => '>=0.3.0' unless File.directory?(File.join(Rails.root, 'vendor/plugins/cucumber-rails'))
config.gem 'database_cleaner', :lib => false, :version => '>=0.5.0' unless File.directory?(File.join(Rails.root, 'vendor/plugins/database_cleaner'))

#Autotest
config.gem "ZenTest", :lib => false
config.gem "autotest-rails", :lib => false
config.gem "autotest-fsevent", :lib => false
config.gem "autotest-growl", :lib => false
# dont forget to make a ~/.autotest file with
#   require "autotest/growl"
#   require "autotest/fsevent"

config.gem 'dry_scaffold', :version => ">= 0.3.8", :lib => false
# Handy for debugging E.g. script/server --debugger
config.gem "ruby-debug"
config.gem "rails-footnotes"

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors           = false
