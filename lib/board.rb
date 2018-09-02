require "./lib/peg"
require "pry"

class Board
  attr_reader :grid


  def initialize()
    @grid = Hash.new()
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

  def add_ship(pegs)
    #pegs = input_to_pegs(first, last, num)
    pegs.each do |peg|
      mark_peg_as_ship(peg)
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

  end

  def attack(coord)
    peg = @grid[coord[0]][coord[1]]
    if peg.is_ship
      peg.hit
    else
      peg.miss
    end

  end




end
