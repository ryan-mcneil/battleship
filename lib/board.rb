require "./lib/peg"
require "./lib/ship"
require "pry"

class Board
  attr_reader :grid


  def initialize()
    @grid = Hash.new()
    @grid_arr = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4",
                "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    @ships = []

  end

  def build_board(class_type = Peg)
    row_syms = ["A", "B", "C", "D"]
    row_syms.each do |row_sym|
      @grid[row_sym] = build_row(class_type)
    end
  end


  def build_row (class_type)
    row = Hash.new()
    4.times do |col|
      row[(col+1).to_s] = class_type.new()
    end
    return row
  end

  def add_ship(coords)
    #pegs = input_to_pegs(first, last, num)
    ship = Ship.new(coords)
    coords.each do |coord|
      mark_peg_as_ship(coord)
    end
  end

  # def input_to_pegs(first, last, num)
  #   pegs = []
  #   if num == 2
  #     pegs << first
  #     pegs << last
  #   pegs << first
  #   if first[0]==last[0]
  #     if first[1]<last[1]
  # end



  def mark_peg_as_ship(peg)
    # first char is Row, second is Colomn
    @grid[peg[0]][peg[1]].set_ship
  end

  def display()
    puts "=========="
    puts ". 1 2 3 4 "
    @grid.each.with_index do |row, index|
      print row[0] + " "
      display_states(row[1])
    end
    puts "=========="
  end

  def display_states(row)
    row.values.each do |peg|
      print peg.state + " "
    end
    print "\n"
  end



  def attack(coord)
    peg = @grid[coord[0]][coord[1]]
    if peg.is_ship
      @ships.each do |ship|
        ship.hit if ship.coords.include?(coord)
      end
      peg.hit
    else
      peg.miss
    end

  end

  def get_comp_ship(length)
    start = random_space
    if [0,1].sample == 1
      place_vert(start,length)
    else
      place_horz(start,length)
    end
  end

  def place_horz(start, length)
    spaces = []
    length.times do |i|
      spaces[i] = start
      # need a new string/object id otherwise every element will be the same
      start = start.next
    end
    spaces
  end

  def place_vert(start, length)
    spaces = []
    length.times do |i|
      spaces[i] = start
      # need a new string/object id otherwise every element will be the same
      start = start[0].next + start[1]
    end
    spaces
  end

  def random_space
    @grid_arr.sample
  end



  def is_valid?(coords)
    coords.all? do |coord|
      if @grid_arr.include?(coord)
        !@grid[coord[0]][coord[1]].is_ship
      end
    end
  end


end
