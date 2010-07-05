require 'picasync/album'
require 'picasync/image'
require 'picasync/call'

require 'rubygems'
require 'fastercsv'

module Picasync

  module Sync

    class All

      def initialize
        current_albums = []
        albums = Album.find(:all) 
        albums.each {|album| current_albums << album.id}
        albums_old = [];images_old = {};modified = [];new = [];deleted = []
        albums_csv = FasterCSV.read("#{RAILS_ROOT}/lib/picasync/files/albums.csv", :col_sep => "|")
        FasterCSV.foreach("#{RAILS_ROOT}/lib/picasync/files/images.csv", :col_sep => "|") do |col|
          images_old[col[1]] = col[2]
        end
        albums_csv.each {|col| albums_old << col[1]}
        current_albums.each {|album|
          new << album if albums_old.include?(album) == false
        }
        albums_csv.each do |col|
          deleted << col[3] if current_albums.include?(col[1]) == false
          albums.each {|album|
            if album.id == col[1] && album.updated_at != col[2]
              modified << album.id
            end
          }
        end
        new.each {|id|
          Image.mirror(:album, id)
        }
        
        #looks like we have to check each image individually
        Album.find(:all, :images).each do |album|
          album.images.each do |image|
            if images_old.has_key?(image.id) == false
              Image.mirror(image.id, album.id)
            elsif images_old[image.id] != image.updated_at
              Image.mirror(image.id, album.id)
            end
          end
        end
        #reset everything
        CSV.new
      end

    end

    class CSV

      def initialize
        album_csv = File.new("#{RAILS_ROOT}/lib/picasync/files/albums.csv","w+")
        image_csv = File.new("#{RAILS_ROOT}/lib/picasync/files/images.csv","w+")
        albums = Album.find(:all, :images)
        albums.each_with_index do |album,index|
          row = "#{index+1}|#{album.id}|#{album.updated_at}|#{album.title}"
          album_csv.puts row 
          album.images.each do |image|
            row = []
            row << index+1
            row << "#{image.id}"
            row << "#{image.updated_at}"
            row << image.title
            row << image.caption
            row << image.tiny
            row << image.small
            row << image.medium
            row << image.large
            image_csv.puts row.join('|').gsub(/\n/){}
          end
        end
        album_csv.close
        image_csv.close
      end

    end

  end

end

