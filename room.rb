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
end