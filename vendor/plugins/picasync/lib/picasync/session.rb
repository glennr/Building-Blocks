require 'rubygems'
require 'mechanize'


require 'mechanize'

module Picasync

  class Session

    attr_reader :token


    def initialize(email=GOOGLE_EMAIL,password=GOOGLE_PASS)
      @email = GOOGLE_EMAIL
      @password = GOOGLE_PASS
      @client=WWW::Mechanize.new.post("https://www.google.com/accounts/ClientLogin", {"accountType"=>"GOOGLE","Email"=>email,"Passwd"=>password,"service"=>"lh2","source"=>"Picasync-App-1"})
      @token=@client.body.split(' ')[2].gsub(/Auth=/){}
      File.expand_path(File.join(File.dirname(__FILE__),'..','config','environment'))

      cookie = File.new("#{File.dirname(__FILE__)}/files/session.token","w+")
      cookie.puts @token
      cookie.close
    end

    def self.token
      token = File.readlines("#{File.dirname(__FILE__)}/files/session.token")[0].gsub(/\n/){}
    end

  end

end
