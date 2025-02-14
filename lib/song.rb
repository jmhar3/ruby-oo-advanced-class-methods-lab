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
    song.save
    song
  end

  def self.new_by_name name
    song = self.create
    song.name = name
    song    
  end

  def self.create_by_name name
    self.new_by_name name
  end    

  def self.find_by_name name
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name name
    self.create_by_name name
    self.find_by_name name
  end

  def self.alphabetical
    self.all.sort {|song1, song2| song1.name <=> song2.name }
  end

  def self.new_from_filename filename
    song = self.create
    file_data = filename.split(" - ")
    song.name = file_data[1].gsub ".mp3", ""
    song.artist_name = file_data[0]
    song
  end

  def self.create_from_filename filename
    self.new_from_filename filename
  end

  def self.destroy_all
    self.all.clear
  end
end
