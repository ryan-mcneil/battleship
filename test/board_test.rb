require_relative 'test_helper'
require './lib/board'

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_it_can_build_board
    board = Board.new
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
    board = Board.new
    expected = {"1" => "", "2" => "", "3" => "", "4" => "" }
    row = board.build_row(String)
    assert_equal expected, row
    # make sure we have 4 columns
    assert_equal 4, row.count
    # make sure nothing weird happened
    assert_nil row["5"]
  end

  def test_that_when_initialized_contents_are_pegs
    board = Board.new
    board.build_board()
    # now that we know we can create a board of strings, let's
    # test we can populate with Peg objects
    assert_instance_of Peg, board.grid["A"]["1"]
    assert_instance_of Peg, board.grid["D"]["4"]
  end

  def test_it_can_add_ship
    board = Board.new
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
    board = Board.new
    board.build_board()
    board.mark_peg_as_ship("A1")
    assert board.grid["A"]["1"].is_ship
    refute board.grid["B"]["3"].is_ship
  end

  def test_it_can_be_attacked
    board = Board.new
    board.build_board()
    board.add_ship(["A1", "A2"])
    board.attack("A1")
    assert_equal "HIT!", board.attack("A1")
    assert_equal "H", board.grid["A"]["1"].state
    assert_equal "MISS!", board.attack("B1")
    assert_equal "M",  board.grid["B"]["1"].state
  end

  def test_it_can_place_horizontally
    board = Board.new
    assert_equal ["D3", "D4"], board.place_horz("D3", 2)
    assert_equal ["A1", "A2", "A3"], board.place_horz("A1", 3)
  end

  def test_it_can_place_vertically
    board = Board.new
    assert_equal ["C3", "D3"], board.place_vert("C3", 2)
    assert_equal ["A1", "B1", "C1"], board.place_vert("A1", 3)
  end

  def test_it_randomly_picks_a_space_on_the_board
    board = Board.new
    grid_arr = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4",
                "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    assert grid_arr.include?(board.random_space)
    assert grid_arr.include?(board.random_space)
    assert grid_arr.include?(board.random_space)
  end

  def test_it_can_validate
    board = Board.new
    board.build_board()
    assert board.is_valid?(["A1"])
    board.mark_peg_as_ship("A1")
    refute board.is_valid?(["A1"])
    refute board.is_valid?(["E1"])

    assert board.is_valid?(["B1", "B2"])
    board.mark_peg_as_ship("B2")
    refute board.is_valid?(["B1", "B2"])
    refute board.is_valid?(["E1", "A1"])

    assert board.is_valid?(["C1", "C2", "C3"])
    board.mark_peg_as_ship("C2")
    refute board.is_valid?(["C1", "C2", "C3"])
  end


end

# board = Board.new()
# board.build_board
# board.add_ship(["A1", "A2"])
# board.attack("A1")
# board.attack("D3")
# board.display
# binding.pry
