require 'minitest/autorun'
require 'minitest/rg'
require_relative('../guest')
require_relative('../bar')


class TestGuest < MiniTest::Test

  def setup
    @beer = {type: "beer", price: 4}
    @guest1 = Guest.new("Mike", "metal", 100, 1)
    @guest2 = Guest.new("Susan", "rock", 150, 0.5)
    @bar = Bar.new

  end 

  def test_guest_creation
    assert_equal("Mike", @guest1.name)
  end

  def test_guest_creation_2
    assert_equal("rock", @guest2.genre)
  end

  def test_guest_buy_drinks
    @guest1.buy_drink(@beer)
    assert_equal(1,@guest1.number_drinks)
    assert_equal(96,@guest1.cash)
  end

  def test_guest_go_to_bank
    @guest1.go_to_bank
    assert_equal(150, @guest1.cash)
  end

  def test_guest_pay_room_fee
    @guest1.pay(50)
    assert_equal(50, @guest1.cash)
  end
end
