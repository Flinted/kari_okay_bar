require_relative('./viewer')
require_relative('./song')
require_relative('./room')
require_relative('./guest')


class KariOkayBar

  attr_reader(:rooms, :guests, :time, :songs, :viewer, :guest_group, :playlist)

  def initialize(rooms, viewer)
    @viewer = viewer
    @rooms = rooms
    @guests = []
    @songs = [
      Song.new("Creep", "Radiohead", "alternative", 220 ),
      Song.new("Song 2", "Blur", "indie", 380 ),
      Song.new("One", "Metallica", "metal", 480 ),
      Song.new("Pokemon Theme", "Pokemon", "tv", 250 )
    ]
    @guest_group = []
    @playlist =[]
    @time = 0
    @run = true
  end

  def room_count
    @rooms.size
  end

  def add_room(new_room)
    @rooms << new_room
  end

  def remove_room(room)
    @rooms.delete(room)
  end

  def time_passes
    @time += 15
  end

  def runcheck
    return @run
  end

  def playlist_length
    length = 0
    @playlist.each do |song| length += song.length
    end
    return length
  end

  def assign_song_to_room
    @viewer.song_assign(self)
    song = @songs[gets.chomp.to_i - 1]
    @viewer.room_assign(self)
    room = @rooms[gets.chomp.to_i - 1]
    room.add_song(song)
    @viewer.confirm_assign(song,room)
  end

  def assign_guest_to_room
    @viewer.guest_assign(self)
    guest = @guests[gets.chomp.to_i - 1]
    @viewer.room_assign(self)
    room = @rooms[gets.chomp.to_i - 1]
    room.add_guest(guest)
    @guests.delete(guest)
    @viewer.confirm_assign(guest,room)
  end

  def make_playlist()
    end_loop = false
    while end_loop == false
      system('clear')
      @viewer.playlist_info(self)
      puts
      @viewer.song_assign(self)
      song_ref = gets.chomp.to_i-1
      @playlist << @songs[song_ref]
      @viewer.confirm_loop()
      end_loop = true if  gets.chomp.upcase != "Y"
    end
  end

  def menu_choice(selection)
    case selection

    when 1
      @viewer.room_display(self)
      @viewer.prompt
      gets.chomp
    when 2
      @viewer.guest_display(self)
      @viewer.prompt
      gets.chomp
    when 3
      @viewer.songs_display(self)
      @viewer.prompt
      gets.chomp
    when 4
      @viewer.get_room_name
      name = gets.chomp
      @viewer.get_room_capacity
      capacity = gets.chomp.to_i
      @viewer.get_room_rate
      cost = gets.chomp.to_i

      @rooms << Room.new(name, capacity, cost)
    when 5
      @viewer.get_guest_name
      name = gets.chomp
      @viewer.get_guest_genre
      genre = gets.chomp
      @viewer.get_guest_cash
      cash = gets.chomp.to_i
      @viewer.get_guest_drink_rate
      drink_rate = gets.chomp.to_i

      @guests << Guest.new(name,genre,cash,drink_rate)
    when 6
      puts @viewer.get_song
      song = gets.chomp
      puts @viewer.get_artist
      artist = gets.chomp
      puts @viewer.get_genre
      genre = gets.chomp
      puts @viewer.get_length
      length = gets.chomp.to_i

      @songs << Song.new(song,artist,genre,length)
    when 7
      assign_song_to_room()
      puts @viewer.prompt()
      gets.chomp
    when 8
      assign_guest_to_room()
      puts @viewer.prompt()
      gets.chomp

    when 9
      make_playlist()

    when 10
      @viewer.playlist_info(self)
      @viewer.room_assign(self)
      room = gets.chomp.to_i-1
      @rooms[room].add_list_songs(@playlist)
      @playlist.clear
      puts
      puts @viewer.confirm_playlist_assign(room)
    when 12
      @run = false
    else
      @viewer.menu
    end
  end
end



room1 = Room.new("Metal Room", 4, 60)
room2 = Room.new("Chill Out Room", 3, 100)
room3 = Room.new("Dance Room", 8, 150)


run = KariOkayBar.new([room1,room2,room3],Viewer.new)

while run.runcheck() == true
run.menu_choice(run.viewer.menu)
end
