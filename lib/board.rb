require "./lib/peg"

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



end
