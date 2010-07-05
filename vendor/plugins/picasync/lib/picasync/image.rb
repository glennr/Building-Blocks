require 'picasync/call'

require 'rubygems'
require 'hpricot'
require 'digest/sha2'
require 'mechanize'

module Picasync

  class Image

    attr_reader :title, :updated_at, :id, :caption, :path, :album, :timestamp, :tiny, :small, :medium, :tiny_uri, :small_uri, :medium_uri, :large, :large_uri

    def initialize(album,id=nil,updated_at=nil,title=nil,caption=nil,path=nil,timestamp=nil,tiny=nil,small=nil,medium=nil,large=nil,tiny_uri=nil,small_uri=nil,medium_uri=nil,large_uri=nil)
      @caption = caption
      @id = id
      @updated_at = updated_at
      @title = title
      @path = path
      @tiny = tiny
      @small = small
      @medium = medium
      @large = large
      @tiny_uri = tiny_uri
      @small_uri = small_uri
      @medium_uri = medium_uri
      @large_uri = large_uri
      @album = album
      @timestamp = timestamp
    end

    def self.find(param, id=nil, authkey=nil)
      ids = []
      if !authkey
        doc = Call.new('get',"/data/feed/api/user/#{GOOGLE_USER}/albumid/#{id}?kind=photo").response
      else
        doc = Call.new('get',"/data/feed/api/user/#{GOOGLE_USER}/albumid/#{id}?kind=photo&authkey=#{authkey}").response
      end
      (doc/:entry).each {|entry|
        ids << entry.at("gphoto:id").inner_text
      }
      found = []
      case param
      when :all
      else
        if ids.include?(param)
          ids = []
          ids << id
          p ids.size
        end
      end
      (doc/:entry).each do |entry|
        caption = entry.at("media:description").inner_text
        path = entry.at("media:content").attributes['url']
        title = entry.at(:title).inner_text
        imgid = entry.at("gphoto:id").inner_text
        albumid = entry.at("gphoto:albumid").inner_text
        img = {}
        img_uri = {}
        %w(tiny small medium).each_with_index do |size,i|
          uri = (entry/"media:thumbnail")[i].attributes['url']
          img_uri[size.to_sym] = uri
          img[size.to_sym] = "#{Digest::SHA2.hexdigest(uri).split('')[0..11].join('')}.jpg"
        end
        uri = entry.at("media:content").attributes['url']
        large_uri = "#{uri}?imgmax=800"
        large = "#{Digest::SHA2.hexdigest(uri).split('')[0..11].join('')}.jpg"
        timestamp = entry.at("gphoto:timestamp").inner_text
        updated_at = entry.at(:updated).inner_text
        if ids.size == 1 && albumid == id
          found << Image.new(albumid,imgid,updated_at,title,caption,path,timestamp,img[:tiny],img[:small],img[:medium],large,img_uri[:tiny],img_uri[:small],img_uri[:medium],large_uri)
        elsif ids.size > 1
          found << Image.new(albumid,imgid,updated_at,title,caption,path,timestamp,img[:tiny],img[:small],img[:medium],large,img_uri[:tiny],img_uri[:small],img_uri[:medium],large_uri)
        else
          found = "NOTICE: Image #{param} not found in Album #{id}"
        end
    end
      found
    end


    def self.mirror(param, id=nil)
      images = []
      @count = 0
      case param
      when :all
        albums = Album.find(:all, :images)
        albums.each {|album|
          album.images.each {|image|
            images << image
          }
        }
      when :album
        album = Album.find_by_id(id)
        unless album.images.size < 1
          album.images.each {|image| images << image}
        end
      else
        images << Image.find(param, id).first
      end
      unless images.size < 1
        images.each do |image|
          save_binary(image.tiny_uri,image.tiny)
          save_binary(image.small_uri,image.small)
          save_binary(image.medium_uri,image.medium)
          save_binary(image.large_uri,image.large)
        end
      puts "downloaded #{@count} images"
      end
    end


    private

    def self.save_binary(uri,new)
      binary = WWW::Mechanize.new.get(uri)
      binary.save_as("#{PICASA_ASSETS_PATH}/#{new}")
      @count += 1
    end


  end

end
