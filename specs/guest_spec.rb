require 'minitest/autorun'
require 'minitest/rg'
require_relative('../guest')
require_relative('../bar')
require_relative('../room')


class TestGuest < MiniTest::Test

  def setup
    @beer = {type: "beer", price: 4}
    @guest1 = Guest.new("Mike", "metal", 100, 1)
    @guest2 = Guest.new("Susan", "rock", 150, 0.5)
    @guest3 = Guest.new("Chris", "indie", 5, 2)
    @bar = Bar.new
    @room1 = Room.new("Metal Room", 4, 60)

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

  def test_guest_can_afford_to_stay
    assert_equal(true, @guest1.stay_check(@room1))
  end

  def test_guest_cannot_afford_to_stay
    assert_equal(false, @guest3.stay_check(@room1))
  end

end
