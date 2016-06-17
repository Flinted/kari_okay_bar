class Song

  attr_reader(:name, :artist, :genre,:length)

  def initialize(song_name,artist_name,genre,length_in_secs)
    @name = song_name
    @artist = artist_name
    @genre = genre
    @length = length_in_secs
  end
end