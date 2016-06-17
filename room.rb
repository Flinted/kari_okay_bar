class Room

  attr_reader(:name,:capacity,:rate,:guests,:songs)

  def initialize(room_name, capacity, room_rate)
    @name = room_name
    @capacity = capacity
    @rate = room_rate
    @guests = []
    @songs = []
  end

  def number_songs
    @songs.size
  end

  def number_guests
    @guests.size
  end

  def add_song(song)
    @songs << song
  end

  def add_guest(guest)
    @guests << guest
  end

  def playlist_length
    length = 0
    for song in @songs
    length += song.length
    end
    return length
  end
end