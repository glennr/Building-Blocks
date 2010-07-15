require 'picasync'

begin
  GOOGLE_EMAIL = APP_CONFIG[:google][:picasa][:email]
  GOOGLE_PASS = APP_CONFIG[:google][:picasa][:password]
  GOOGLE_USER = APP_CONFIG[:google][:picasa][:user]
rescue
  puts "WARNING: Ensure you've set up settings.secret.yml with your Picasa config"
  raise
end