require 'pry'
class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    file_split = filename.split(/[-,]/)
    name = file_split[1].strip
    artist = file_split[0].strip
    song = self.new(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.artist.add_song(song)
    song

  end
end
