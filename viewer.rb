class Viewer

  def menu
    <<-menu
      Welcome to the Kari-OK Bar.

      1: View Rooms
      2: View Guests
      3: View Songs

      4: Add Songs 
      5: Add Guests
      6: Add Rooms

      Exit. Leave
    menu
  end

  def room_display(karaokebar)
    for room in karaokebar.rooms 
      puts "There is the #{room.name}, it costs #{room.rate} per hour and can hold #{room.capacity}"
    end
  end

  def songs_display(karaokebar)
    for song in karaokebar.rooms 
      puts "#{song.name} by #{song.artist}, it is #{song.length} seconds long and in the #{song.genre} genre."
    end
  end

  def guest_display(karaokebar)
    for guest in karaokebar.guests 
      puts "#{guest.name} is currently waiting in the bar"
    end
  end

  def get_song
    print " What is the new song called? "
  end

  def get_artist
    print "and who is the artist? "
  end

  def get_genre
    print "what genre is it?"
  end

  def get_length
    print "how long is the song in seconds?"
  end

end