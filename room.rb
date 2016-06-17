class Room

  attr_reader(:name,:capacity,:rate,:guests,:songs)

  def initialize(room_name, capacity, hourly_room_rate)
    @name = room_name
    @capacity = capacity
    @rate = hourly_room_rate/60    #per min
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

  def add_list_songs(list)
    list.each do |song|  @songs << songs
    end
  end

  def add_guest(guest)
    number_guests() < @capacity ? @guests << guest : "Full"
  end

  def add_guestlist(guests)
    guests.each do |guest| number_guests() < @capacity ? @guests << guest : "Full"
    end
  end

  def playlist_length
    length = 0
    @songs.each do |song| length += song.length
    end
    return length
  end

  def fee
    @rate * (playlist_length()/60) 
  end
   
  def leave(guest_to_leave)
    @guests.delete(guest_to_leave)
    # @guests.reject! {|guest| guest.name == guest_to_leave.name}
  end

end