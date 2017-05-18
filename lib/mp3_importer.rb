require 'pry'
class MP3Importer
  attr_accessor :filepath

  def initialize(filepath)
    @file_path=filepath
  end

  def path
    @file_path
  end

  def files
    Dir["#{path}/*.mp3"].map{|file| file.split('/').last}
  end

  def import
    self.files.each do |song|
      Song.new_by_filename(song)
    end
  end
end
