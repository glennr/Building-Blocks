require 'picasync/session'

require 'rubygems'
require 'net/http'
require 'mechanize'
require'eventmachine'
require 'hpricot'


module Picasync

  class Call

    attr_reader :response, :request, :user,:status,:retries,:method
    attr_writer :response, :status, :retries


    def initialize(method,request,user=GOOGLE_USER)
      @response = nil
      @request = request.to_s
      @user = user
      @status = nil
      @retries = 0
      @method = method
      hit
    end


    def hit
      #token = Session.token
      http = Net::HTTP.new("picasaweb.google.com", 80)
      path = "/data/feed/api/user/#{@user}/"
      server = 'picasaweb.google.com'
      headers = {

        "Content-Type" => "application/atom+xml"
      }
      case @method
      when 'post'
        response = http.post(path,@request,headers)
      when 'get'
        response = http.get(@request,headers)
      when 'delete'
        response = http.delete(@request,headers)
      end
      @status = response.code.to_i
      check_response(response)
    end


    def check_response(response)
      case @status
      when 200, 201
        @response = Hpricot.XML(response.body)
      when 404
        @response = 404
      else
        return if @retries > 3
        #Session.new
        #puts "Setting session"
        @retries += 1
        hit
      end
    end

  end

end

