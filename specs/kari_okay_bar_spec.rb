require 'minitest/autorun'
require 'minitest/rg'
require_relative('../kari_okay_bar')
require_relative('../guest')
require_relative('../room')
require_relative('../song')
require_relative('../bar')
require_relative('../viewer')


class TestKariOkayBar < MiniTest::Test
  
  def setup 
  @viewer = Viewer.new()
  @guest1 = Guest.new("Mike", "metal", 100, 1)
  @guest2 = Guest.new("Susan", "rock", 150, 0.5)
  @guest3 = Guest.new("Mike", "metal", 100, 1)
  @guest4 = Guest.new("Susan", "rock", 150, 0.5)
  @guest5 = Guest.new("Susan", "rock", 150, 0.5)
  @song1 = Song.new("Creep", "Radiohead", "alternative", 220 )
  @song2 = Song.new("Song 2", "Blur", "indie", 380 )
  @song3 = Song.new("One", "Metallica", "metal", 480 )
  @song4 = Song.new("Pokemon Theme", "Pokemeon", "tv", 250 )
  @songs = [@song1,@song2,@song3,@song4]
  @room1 = Room.new("Metal Room", 4, 60)
  @room2 = Room.new("Chill Out Room", 3, 100)
  @room3 = Room.new("Dance Room", 8, 150)
  rooms = [@room1,@room2,@room3]

  @karaoke = KariOkayBar.new(rooms) 
  end

  def test_creation
    assert_equal(3, @karaoke.room_count)
  end

  def test_add_room
    @karaoke.add_room(Room.new("Punk Room", 2, 75))
    assert_equal(4, @karaoke.room_count)
  end

  def test_remove_room
    @karaoke.remove_room(@room3)
    assert_equal(2, @karaoke.room_count)
  end
end
