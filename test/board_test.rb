require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/board'

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new()
    assert_instance_of Board, board
  end

  def test_it_can_build_board
    board = Board.new()
    expected = {"A" => {"1" => 0, "2" => 0, "3" => 0, "4" => 0 },
                "B" => {"1" => 0, "2" => 0, "3" => 0, "4" => 0 },
                "C" => {"1" => 0, "2" => 0, "3" => 0, "4" => 0 },
                "D" => {"1" => 0, "2" => 0, "3" => 0, "4" => 0 }
                }

    board.build_board
    assert_equal expected, board.grid
  end

  def test_it_can_build_a_row
    board = Board.new()
    expected = {"1" => 0, "2" => 0, "3" => 0, "4" => 0 }
    assert_equal expected, board.build_row
  end
end
