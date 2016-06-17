require 'minitest/autorun'
require 'minitest/rg'
require_relative('../room')
require_relative('../song') 
require_relative('../guest') 


class TestRoom < MiniTest::Test

  def setup
    @guest1 = Guest.new("Mike", "metal", 100, 1)
    @guest2 = Guest.new("Susan", "rock", 150, 0.5)
    @song1 = Song.new("Creep", "Radiohead", "alternative", 220 )
    @song2 = Song.new("Song 2", "Blur", "indie", 220 )

    guests = [guest1,guest2]
    songs = [song1,song2]
    @room1 = Room.new("Metal Room", 4, 15)
  end

  def test_room_creation
    assert_equal(4, @room1.capacity)
  end

  def test_add_song_to_room
    @room1.add_song(@song1)
    assert_equal(1, @room1.number_songs)

  end


end
