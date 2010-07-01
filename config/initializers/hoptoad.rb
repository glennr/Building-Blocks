HoptoadNotifier.configure do |config|
  #config.api_key = APP_CONFIG[:hoptoad][:api_key]
  config.api_key = ENV['HOPTOAD__API_KEY']
end
