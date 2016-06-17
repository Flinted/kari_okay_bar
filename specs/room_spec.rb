require 'minitest/autorun'
require 'minitest/rg'
require_relative('../room')
require_relative('../song') 
require_relative('../guest') 


class TestRoom < MiniTest::Test

  def setup
    @guest1 = Guest.new("Mike", "metal", 100, 1)
    @guest2 = Guest.new("Susan", "rock", 150, 0.5)
    @guest3 = Guest.new("Mike", "metal", 100, 1)
    @guest4 = Guest.new("Susan", "rock", 150, 0.5)
    @guest5 = Guest.new("Susan", "rock", 150, 0.5)
    @song1 = Song.new("Creep", "Radiohead", "alternative", 220 )
    @song2 = Song.new("Song 2", "Blur", "indie", 380 )

    @room1 = Room.new("Metal Room", 4, 60)
  end

  def test_room_creation
    assert_equal(4, @room1.capacity)
  end

  def test_add_song_to_room
    @room1.add_song(@song1)
    assert_equal(1, @room1.number_songs)
  end

  def test_room_rate
    assert_equal(1,@room1.rate)
  end

  def test_add_guest_to_room
    @room1.add_guest(@guest1)
    assert_equal(1, @room1.number_guests)
  end

  def test_room_full
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.add_guest(@guest3)
    @room1.add_guest(@guest4)
    @room1.add_guest(@guest5)
    assert_equal(4,@room1.number_guests)
  end

  def test_playlist_length
    @room1.add_song(@song1)
    @room1.add_song(@song2)
    assert_equal(600, @room1.playlist_length)
  end

  def test_fee_generate
    @room1.add_song(@song1)
    @room1.add_song(@song2)
    assert_equal(10, @room1.fee)
  end

end
