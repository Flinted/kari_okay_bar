require_relative('./viewer')
require_relative('./song')
require_relative('./room')
require_relative('./guest')
require_relative('./bar')


class KariOkayBar

  attr_reader(:rooms, :guests, :bar, :time, :songs, :viewer, :guest_group, :playlist, :cash)

  def initialize(rooms, viewer, bar)
    @viewer = viewer
    @rooms = rooms
    @bar = bar
    @guests = [
      Guest.new("Mike", "metal", 100, 1),
      Guest.new("Susan", "rock", 150, 0.5),
      Guest.new("Chris", "indie", 500, 2)
    ]
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
    @cash = 0
  end

  def time_passes
    @time += 30
    for room in @rooms
      for guest in room.guests 
        @cash += guest.pay(room.fee)
        enjoy = guest.like_music(room)
        @viewer.guest_enjoy( room, guest, enjoy )
        # guest.buy_drink(@bar.get_drink)
        room.leave(guest) if guest.stay_check(room) == false
      end
      puts
      @viewer.room_summary(room)
      puts @viewer.money(@cash)
      @viewer.prompt
      gets.chomp
    end
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

  def runcheck
    return @run
  end

  def playlist_length
    length = 0
    @playlist.compact!
    @playlist.each do |song| length += song.length
    end
    return length
  end

  def add_new_song
    puts @viewer.get_song
    song = gets.chomp
    puts @viewer.get_artist
    artist = gets.chomp
    puts @viewer.get_genre
    genre = gets.chomp
    puts @viewer.get_length
    length = gets.chomp.to_i

    @songs << Song.new(song,artist,genre,length)
  end

  def assign_song_to_room
    system('clear')
    @viewer.song_assign(self)
    song = @songs[gets.chomp.to_i - 1]
    @viewer.room_assign(self)
    room = @rooms[gets.chomp.to_i - 1]
    room.add_song(song)
    @viewer.confirm_assign(song,room)
    puts @viewer.prompt()
    gets.chomp
  end

  def add_new_room
    @viewer.get_room_name
    name = gets.chomp
    @viewer.get_room_capacity
    capacity = gets.chomp.to_i
    @viewer.get_room_rate
    cost = gets.chomp.to_i

    @rooms << Room.new(name, capacity, cost)
  end

  def add_new_guest
    @viewer.get_guest_name
    name = gets.chomp
    @viewer.get_guest_genre
    genre = gets.chomp
    @viewer.get_guest_cash
    cash = gets.chomp.to_i
    @viewer.get_guest_drink_rate
    drink_rate = gets.chomp.to_i

    @guests << Guest.new(name,genre,cash,drink_rate)
  end

  def make_guest_group
    system('clear')
      end_loop = false
      while end_loop == false
        system('clear')
        @viewer.group_info(self)
        puts
        @viewer.guest_assign(self)
        guest_ref = gets.chomp.to_i-1
        @guest_group << @guests[guest_ref]
        @guests.delete_at(guest_ref)
        @guest_group.compact!
        @viewer.confirm_loop()
        end_loop = true if  gets.chomp.upcase != "Y"
      end
  end

  def assign_guest_to_room
    system("clear")
    @viewer.guest_assign(self)
    guest = @guests[gets.chomp.to_i - 1]
    @viewer.room_assign(self)
    room = @rooms[gets.chomp.to_i - 1]
    room.add_guest(guest)
    @guests.delete(guest)
    @viewer.confirm_assign(guest,room)
    puts @viewer.prompt()
    gets.chomp
  end

  def assign_guest_group
    system('clear')
    @viewer.group_info(self)
    @viewer.room_assign(self)
    room = gets.chomp.to_i-1
    @rooms[room].add_guestlist(@guest_group.compact)
    @guest_group.clear
    puts
    puts @viewer.confirm_group_assign(@rooms[room])
    puts @viewer.prompt
    gets.chomp
  end

  def make_playlist()
    system('clear')
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

  def assign_playlist()
    system('clear')
    @viewer.playlist_info(self)
    @viewer.room_assign(self)
    room = gets.chomp.to_i-1
    @rooms[room].add_list_songs(@playlist.compact)
    @playlist.clear
    puts
    puts @viewer.confirm_playlist_assign(@rooms[room])
    puts @viewer.prompt
    gets.chomp
  end

  def menu_choice(selection)
    case selection

    when 1
      @viewer.room_display(self)
      @viewer.prompt()
      gets.chomp
    when 2
      @viewer.guest_display(self)
      @viewer.prompt
      gets.chomp
    when 3
      @viewer.songs_display(self)
      @viewer.prompt
      gets.chomp
    when 4 #add new room
      add_new_room()
    when 5 #add new guest
      add_new_guest()
    when 6 #add new song
      add_new_song()
    when 7 #assign song to room
      assign_song_to_room()
    when 8 #assign guest to room
      assign_guest_to_room()
    when 9 #make playlist
      make_playlist()
    when 10 #assign playlist
      assign_playlist()
    when 11 #make guest group
      make_guest_group()
    when 12 #assign guest group
      assign_guest_group()
    when 15
      time_passes()
    when 20
      @run = false
    else
      @viewer.menu
    end
  end
end



room1 = Room.new("Metal Room", 4, 60)
room2 = Room.new("Chill Out Room", 3, 100)
room3 = Room.new("Dance Room", 8, 150)


run = KariOkayBar.new([room1,room2,room3],Viewer.new, Bar.new)

while run.runcheck() == true
run.menu_choice(run.viewer.menu)
end
