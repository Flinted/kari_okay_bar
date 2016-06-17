class KariOkayBar

  attr_reader(:rooms, :guests, :time, :songs)

  def initialize(rooms, viewer)
    @viewer = viewer
    @rooms = rooms
    @guests = []
    @songs = []
    @time = 0
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

  def menu_choice(selection)
    case selection

    when 1
      @viewer.room_display
    when 2
      @viewer.guest_display
    when 3
      @viewer.songs_display
    when 4

    when 5

    when 6
      puts @viewer.get_song
      song = gets.chomp
      puts @viewer.get_artist
      artist = gets.chomp
      puts @viewer.get_genre
      genre = gets.chomp
      puts @viewer.get_length
      length = gets.chomp.to_i

      @songs << Songs.new(song,artist,genre,length)
    when "exit"

    else
    end
  end
end