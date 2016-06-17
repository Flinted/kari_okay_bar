require 'minitest/autorun'
require 'minitest/rg'
require_relative('../guest')

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Mike", "metal", 100, 1)
    @guest2 = Guest.new("Susan", "rock", 150, 0.5)
  end 
end
