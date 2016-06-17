class Viewer

  def menu
    system('clear')
    puts <<-menu
      Welcome to the Kari-OK Bar.

      1: View Rooms
      2: View Guests
      3: View Songs

      4: Add Room 
      5: Add Guest
      6: Add Song

      7: Assign Song to room
      8: Assign Guest to room
      9: Make a Playlist
      10: Assign a Playlist to room

      11: Move time 15 minutes
      
      12: Exit
    menu
    puts
    print ":>>"
    choice = gets.chomp.to_i
    puts
    puts
    return choice
  end
  
  def prompt
    puts
    puts "Enter to continue."
  end

  def room_display(karaokebar)
    puts "We have the following rooms available:"
    puts
    for room in karaokebar.rooms 
      puts "There is the #{room.name}, it costs £#{room.rate} per minute and can hold #{room.capacity} people.  It currently has #{room.number_guests} guests."
    end
  end

  def songs_display(karaokebar)
    puts "We have the following songs available:"
    puts
    for song in karaokebar.songs
      puts "#{song.name} by #{song.artist}, it is #{song.length} seconds long and in the #{song.genre} genre."
    end
  end

  def guest_display(karaokebar)
    puts "These are the guests currently waiting for a room:"
    puts
    for guest in karaokebar.guests 
      puts "#{guest.name} is currently waiting in the bar"
    end
  end

# get song info:
  def get_song
    puts " What is the new song called? "
    print ":>>"
  end

  def get_artist
    puts "and who is the artist? "
    print ":>>"
  end

  def get_genre
    puts "what genre is it?"    
    print ":>>"
  end

  def get_length
    puts "how long is the song in seconds?"
    print ":>>"
  end

  # get room info:
  def get_room_name
    puts "What is the new room called?"
    print ":>>"
  end

  def get_room_capacity
    puts "how many people can this room hold?"
    print ":>>"
  end

  def get_room_rate
    puts "how much is the room per hour?"
    print ":>>"
  end

  # get guest info

  def get_guest_name
    puts "What is the guest called?"
    print ":>>"
  end

  def get_guest_genre
    puts "what is their favourite genre?"
    print ":>>"
  end

  def get_guest_cash
    puts "how much money do they have?"
    print ":>>"
  end

  def get_guest_drink_rate
    puts "how many drinks do they have every 15 minutes?"
    print ":>>"
  end
end