class Board
  attr_reader :grid

  def initialize()
    @grid = Hash.new()
  end

  def build_board
    row_syms = ["A", "B", "C", "D"]
    row_syms.each do |row_sym|
      @grid[row_sym] = build_row
    end
  end


  def build_row ()
    row = Hash.new()
    4.times do |col|
      row[(col+1).to_s] = 0
    end
    return row
  end



end
