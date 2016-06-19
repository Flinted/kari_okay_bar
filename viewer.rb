class Viewer

  def menu
    system('clear')
    puts <<-menu


      8  dP           w      
      8wdP  .d88 8d8b w      
      88Yb  8  8 8P   8 wwww 
      8  Yb `Y88 8    8      
                             
      .d88b. 8                
      8P  Y8 8.dP .d88 Yb  dP 
      8b  d8 88b  8  8  YbdP  
      `Y88P' 8 Yb `Y88   dP   
                        dP  

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

  def confirm_loop
    puts
    puts "Would you like to add another? Y/N"
  end

  def room_display(karaokebar)
    puts
    puts "We have the following rooms available:"
    puts
    for room in karaokebar.rooms 
      puts "There is the #{room.name}, it costs £#{room.rate} per minute and can hold #{room.capacity} people.  It currently has #{room.number_guests} guests and #{room.number_songs} songs assigned."
    end
  end

  def songs_display(karaokebar)
    puts
    puts "We have the following songs available:"
    puts
    for song in karaokebar.songs
      puts "#{song.name} by #{song.artist}, it is #{song.length} seconds long and in the #{song.genre} genre."
    end
  end

  def song_assign(karaokebar)
    puts
    puts "We have the following songs available for adding:"
    puts
    count = 1
    for song in karaokebar.songs
      puts "#{count}: #{song.name} by #{song.artist}, it is #{song.length} seconds long and in the #{song.genre} genre."
      count += 1
    end
    puts
    puts "Please enter the number of the song you wish to assign: "
  end

  def playlist_info(karaokebar)
    puts
    puts "The current playlist is #{karaokebar.playlist_length} seconds long."
    puts
    puts "The following songs are in the playlist."
    count = 1
    for song in karaokebar.playlist
        puts "#{count}: #{song.name} by #{song.artist}, it is #{song.length} seconds long and in the #{song.genre} genre."
        count += 1
    end
  end
 
  def confirm_playlist_assign(room)
    puts
    puts "You have succesfully assigned the playlist to the #{room.name} room. The cost for this lists duration for this room is £#{room.fee}."

  end


  def room_assign(karaokebar)
    puts
    puts "We have the following rooms available:"
    puts
    count = 1
    for room in karaokebar.rooms 
      puts "#{count}: There is the #{room.name}, it costs £#{room.rate} per minute and can hold #{room.capacity} people.  It currently has #{room.number_guests} guests and #{room.number_songs} songs assigned."
      count +=1
    end
    puts "Which room would you like to assign?"
  end

  def guest_assign(karaokebar)
    puts
    puts "These are the guests currently waiting for a room:"
    puts
    count = 1
    for guest in karaokebar.guests 
      puts "#{count}: #{guest.name} is currently waiting in the bar"
      count +=1
    end
    puts
    puts "Please enter the guest you wish to assign: "
  end

  def confirm_assign(assigned, room)
    puts
    puts "Added #{assigned.name} to #{room.name} room."
  end

  def guest_display(karaokebar)
    puts "These are the guests currently waiting for a room:"
    puts
    for guest in karaokebar.guests 
      puts "#{guest.name} is currently waiting in the bar"
    end
  end

  def guest_enjoy(room, guest, enjoy)
    puts
    puts "#{guest.name} thinks the music is #{enjoy} in the #{room.name}."
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