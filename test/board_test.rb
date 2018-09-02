require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/board'

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new("")
    assert_instance_of Board, board
  end

  def test_it_can_build_board
    board = Board.new("")
    expected = {"A" => {"1" => "", "2" => "", "3" => "", "4" => "" },
                "B" => {"1" => "", "2" => "", "3" => "", "4" => "" },
                "C" => {"1" => "", "2" => "", "3" => "", "4" => "" },
                "D" => {"1" => "", "2" => "", "3" => "", "4" => "" }
                }

    # build a board of mpty strings to easily compare output
    board.build_board(String)
    assert_equal expected, board.grid
    # make sure we hae four rows
    assert_equal 4, board.grid.count
  end

  def test_it_can_build_a_row
    board = Board.new("")
    expected = {"1" => "", "2" => "", "3" => "", "4" => "" }
    row = board.build_row(String)
    assert_equal expected, row
    # make sure we have 4 columns
    assert_equal 4, row.count
    # make sure nothing weird happened
    assert_nil row["5"]
  end

  def test_that_when_initialized_contents_are_pegs
    board = Board.new("")
    board.build_board()
    # now that we know we can create a board of strings, let's
    # test we can populate with Peg objects
    assert_instance_of Peg, board.grid["A"]["1"]
    assert_instance_of Peg, board.grid["D"]["4"]
  end

  def test_it_can_add_ship
    board = Board.new("")
    board.build_board()
    board.add_ship(["A1", "A2"])
    assert board.grid["A"]["1"].is_ship
    assert board.grid["A"]["2"].is_ship
    refute board.grid["A"]["4"].is_ship

    board.add_ship(["B2", "C2", "D2"])
    assert board.grid["B"]["2"].is_ship
    assert board.grid["C"]["2"].is_ship
    assert board.grid["D"]["2"].is_ship
    refute board.grid["D"]["3"].is_ship
  end

  def test_it_can_set_peg_as_ship
    board = Board.new("")
    board.build_board()
    board.mark_peg_as_ship("A1")
    assert board.grid["A"]["1"].is_ship
    refute board.grid["B"]["3"].is_ship
  end


end

# board = Board.new()
# board.build_board(String)
# binding.pry
