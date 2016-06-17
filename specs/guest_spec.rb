require 'minitest/autorun'
require 'minitest/rg'
require_relative('../guest')

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Mike", "metal", 100, 1)
    @guest2 = Guest.new("Susan", "rock", 150, 0.5)
  end 

  def test_guest_creation
    assert_equal("Mike", @guest1.name)
  end

  def test_guest_creation_2
    assert_equal("rock", @guest2.genre)
  end
end
