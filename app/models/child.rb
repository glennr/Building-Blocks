class Child < ActiveRecord::Base
  GENDERS = {
    "M"    => 'male',
    "F"  => 'female' }

  validates_presence_of :first_name, :likes, :gender, :birthday, :picasa_album, :picasa_authkey
  validates_inclusion_of :gender, :in => GENDERS.keys

  def album?
    self.picasa_album && self.picasa_authkey
  end

  def album
    @album ||= Picasync::Album.find_by_authkey(self.picasa_album, self.picasa_authkey) if album?
  end

  #Expects a url in the format: http://picasaweb.google.com/USER/ALBUM?authkey=AUTHKEY
  def picasa_url=(url)
    #TODO - dont assume theyre all in the same album
    params = url.scan(%r{^http[s]?://picasaweb.google.com/(.*)/(.*)\?authkey=(.*)$}).flatten.compact
    # TODO assert that $1 (user) == GOOGLE_USER
    self.write_attribute(:picasa_album, params[1])
    self.write_attribute(:picasa_authkey, params[2])
  end

end