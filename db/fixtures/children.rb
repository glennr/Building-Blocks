require 'factory_girl'
Dir[File.expand_path(File.join(File.dirname(__FILE__),'/../../spec/factories','**','*.rb'))].each {|f| require f}

unless Rails.env.production?
  puts "Creating dummy child data"
  1.upto 5 do |i|
    Factory(:child)
  end

end
