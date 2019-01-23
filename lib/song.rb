require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(song_string)
    song = self.new
    song.name = song_string
    song
  end

  def self.create_by_name(song_string)
    song = self.new
    song.name = song_string
    @@all << song
    song
  end
  
  def self.find_by_name(song_string)
    @@all.find { |song| song.name == song_string }
  end
  
  def self.find_or_create_by_name(song_string)
    if !self.find_by_name(song_string)
      self.create_by_name(song_string)
    else
      self.find_by_name(song_string)
    end
  end
  
  def self.alphabetical
    @@all.sort_by(&: @name)
  end
end