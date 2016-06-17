require 'minitest/autorun'
require 'minitest/rg'
require_relative('../bank')
require_relative('../guest')

class TestBank < MiniTest::Test

  def setup
    guest1 = Guest.new("Mike", "metal", 100, 1)
    guest2 = Guest.new("Mike", "metal", 100, 1)
    guest3 = Guest.new("Mike", "metal", 100, 1)
    guest4 = Guest.new("Mike", "metal", 100, 1)
    
    guests = [guest1,guest2,guest3,guest4]

    @bank = Bank.new(guests)
  end


  
end
