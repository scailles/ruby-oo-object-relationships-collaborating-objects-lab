class Song 


attr_accessor :name, :artist, :song

@@all=[]

def initialize(name)
    @name=name
    save
end

def save
    @@all << self
end


def self.new_by_filename(filename)
    split_name = filename.split(" - ")
    song = self.new(split_name[1])
    artist = Artist.find_or_create_by_name(split_name[0])
    song.artist = artist
    artist.add_song(song)
    song
end


def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    self.artist = artist
    artist.add_song(self)
end

def self.all
    @@all
end



end