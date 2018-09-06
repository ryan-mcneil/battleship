require 'pry'
require './lib/board'

class Battleship
  attr_reader :user, :comp

  def initialize
    @user = Board.new
    @comp = Board.new
  end

  def intro
    puts "Welcome to BATTLESHIP\n\n"
    @user.build_board
    @comp.build_board

    menu
  end

  def menu
    print "Would you like to (p)lay, read the (i)nstructions, or (q)uit? "
    input = gets.chomp.downcase
    if input == "p" || input == "play"
      start
    elsif input == "i" || input == "instructions"
      puts "this will be a README"
    elsif input == "q" || input == "quit"
      return
    else
      puts "That is not a valid selection. Please try agian."
      menu
    end
  end


  def start
    puts "I have laid out my ships on the grid."
    puts "You now need to layout your two ships."
    puts "The first is two units long and the"
    puts "second is three units long."
    puts "The grid has A1 at the top left and D4 at the bottom right."
    get_input(2)
    get_input(3)
    @comp.set_computer_ship(2)
    @comp.set_computer_ship(3)
    turn
  end

  def turn
    puts "Here's your enemy's board! \n"
    @comp.display
    print "Enter your attack: "
    input = gets.chomp.upcase
    p @comp.attack(input)
    test_for_sunk(@comp, "W")
    @comp.display
    puts "Press ENTER to end turn"
    gets.chomp
    computer_turn
    turn
  end

  def get_input(length)
    nums = {2 => "two", 3 => "three"}
    valid = false
    until valid
      print "Enter the squares for the #{nums[length]}-unit ship: "
      input = gets.chomp.upcase.split(" ")
      # if @user.validate_input
      @user.add_ship(input)
      valid = true
    end
  end

  def computer_turn
    coord = @user.random_fire
    print "The computer attacks...\n\n"
    p @user.attack(coord)
    test_for_sunk(@user, "L")
    puts "Here is your board! \n"
    @user.display
    puts "Press ENTER to begin your turn"
    gets.chomp

  end

  def test_for_sunk(board, w_or_l)
    if sunk_a_ship?(board)
      puts "You've sunk a ship!"
    end
    if sunk_all_ships?(board)
      puts "You've sunk the last ship!"
      endgame(w_or_l)
    end
  end

  def sunk_a_ship?(board)
    board.ships.any? do |ship|
      ship.sunk?
    end
  end

  def sunk_all_ships?(board)
    board.ships.all? do |ship|
      ship.sunk?
    end
  end

  def endgame(w_or_l)
    if w_or_l == "W"
      p "Congratulations, you are the winner"
    else
      p "Sorry, try again later!"
    end
    p "that took too long!"
    exit
  end



end

battleship = Battleship.new
battleship.intro
