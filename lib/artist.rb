require 'pry'
class Artist
  attr_accessor :name, :songs
  @@all =[]
  def initialize (name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    artist_found = self.all.find{|artist| artist.name == name}
    if artist_found  == nil
      artist = Artist.new(name)
    else
      artist_found
    end
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end
end
