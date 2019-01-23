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
    @@all.find { |song| song == song_string }
  end
  
  def self.find_or_create_by_name(song_string)
    if @@all.each { |song| song == song_string }
      return song
    else
      song = self.new
      song.name = song_string
      song
    end
  end
end