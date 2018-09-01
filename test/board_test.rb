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
    expected = {"A" => {"1" => "", "2" => "", "3" => "", "4" => "" },
                "B" => {"1" => "", "2" => "", "3" => "", "4" => "" },
                "C" => {"1" => "", "2" => "", "3" => "", "4" => "" },
                "D" => {"1" => "", "2" => "", "3" => "", "4" => "" }
                }

    board.build_board(String)
    assert_equal expected, board.grid
  end

  def test_it_can_build_a_row
    board = Board.new()
    expected = {"1" => "", "2" => "", "3" => "", "4" => "" }
    assert_equal expected, board.build_row(String)
  end
end

# board = Board.new()
# board.build_board(String)
# binding.pry
