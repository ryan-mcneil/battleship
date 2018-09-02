require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/battleship'
require './lib/board'

class BattleshipTest < Minitest::Test

  def test_it_exists
    battleship = Battleship.new()
    assert_instance_of Battleship, battleship
  end

  def test_it_has_boards
    battleship = Battleship.new()
    assert_instance_of Board, battleship.user
    assert_instance_of Board, battleship.comp
  end

end
