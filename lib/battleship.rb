class Battleship
  attr_reader :user, :comp

  def initialize()
    @user = Board.new("")
    @comp = Board.new("Computer")
  end



end
