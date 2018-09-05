require_relative 'test_helper'
require './lib/peg'

class PegTest < Minitest::Test

  def test_it_exists
    peg = Peg.new()
    assert_instance_of Peg, peg
  end

  def test_ship_initializes_to_false
    peg = Peg.new()
    assert_equal false, peg.is_ship
  end

  def test_state_starts_empty
    peg = Peg.new()
    assert_equal " ", peg.state
  end

  def test_it_can_become_a_ship
    peg = Peg.new()
    peg.set_ship
    assert_equal true, peg.is_ship
  end

  def test_it_can_be_hit
    peg = Peg.new()
    assert_equal "HIT!", peg.hit
    assert_equal "H", peg.state
  end
  
  def test_it_can_be_missed
    peg = Peg.new()
    assert_equal "MISS!", peg.miss
    assert_equal "M", peg.state
  end
end
