require_relative 'test_helper'
require './lib/ship'

class ShipTest < Minitest::Test

  def test_it_exists
    ship = Ship.new(2)
    assert_instance_of Ship, ship
  end

  def test_it_has_length
    ship = Ship.new(2)
    assert_equal 2, ship.length
  end

  def test_it_starts_with_0_hits
    ship = Ship.new(2)
    assert_equal 0, ship.hits
  end

  def test_it_can_take_hits
    ship = Ship.new(2)
    ship.hit
    assert_equal 1, ship.hits
    ship.hit
    assert_equal 2, ship.hits
  end

  def test_it_is_sunk
    ship = Ship.new(3)
    ship.hit
    refute ship.sunk?
    ship.hit
    refute ship.sunk?
    ship.hit
    assert ship.sunk?
  end
  
end
