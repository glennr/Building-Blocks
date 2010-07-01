Compass.add_project_configuration(File.join(RAILS_ROOT, "config", "compass.rb"))
Compass.configuration.environment = RAILS_ENV.to_sym
Compass.configure_sass_plugin!

require "fileutils"
FileUtils.mkdir_p(Rails.root.join("tmp", "stylesheets", "compiled"))
ActionController::Dispatcher.middleware.use(Rack::Static, :root => "tmp/", :urls => ["/stylesheets/compiled"])