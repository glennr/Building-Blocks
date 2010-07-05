require 'rubygems'
require 'rexml/document'

module Picasync
  include REXML

  module XML

    class Req

      class Album

        attr_reader :doc

        def initialize(title)
          @title = title
          doc = Document.new
          entry = doc.add_element "entry"
          entry.add_attributes({ "xmlns" => "http://www.w3.org/2005/Atom", "xmlns:media" => "http://search/yahoo/com/mrss/", "xsi:gphoto" => "http://schemas.google.com/photos/2007"})
          title = entry.add_element "title"
          title.text = @title
          access = entry.add_element "gphoto:access"
          commenting = entry.add_element "gphoto:commentingEnabled"
          timestamp = entry.add_element "gphoto:timestamp"
          media_group = entry.add_element "media:group"
          access.text = "public"
          commenting.text = "true"
          timestamp.text = Time.now.to_i
          category = entry.add_element "category"
          category.add_attributes({"scheme" => "http://schemas.google.com/g/2005#kind", "term" => "http://schemas.google.com/photos/2007#album"})
          @doc = doc.to_s
        end

      end


    end

  end

end
