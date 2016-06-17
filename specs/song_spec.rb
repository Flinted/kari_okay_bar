require 'minitest/autorun'
require 'minitest/rg'
require_relative('../song')

class TestSong < MiniTest::Test

  def setup
    @song1 = Song.new("Creep", "Radiohead", "alternative", 220 )
    @song2 = Song.new("Song 2", "Blur", "indie", 220 )
  end

end
