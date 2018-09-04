require 'pry'
require './lib/board'

class Battleship
  attr_reader :user, :comp

  def initialize()
    @user = Board.new
    @comp = Board.new
  end

  def intro()
    puts "Welcome to BATTLESHIP\n\n"
    @user.build_board
    @comp.build_board

    menu()
  end

  def menu()
    print "Would you like to (p)lay, read the (i)nstructions, or (q)uit? "
    input = gets.chomp.downcase
    if input == "p" || input == "play"
      start()
    elsif input == "i" || input == "instructions"
      puts "this will be a README"
    elsif input == "q" || input == "quit"
      return
    else
      puts "That is not a valid selection. Please try agian."
      menu()
    end
  end


  def start()
    puts "I have laid out my ships on the grid."
    puts "You now need to layout your two ships."
    puts "The first is two units long and the"
    puts "second is three units long."
    puts "The grid has A1 at the top left and D4 at the bottom right./n/n"
    print "Enter the squares for the two-unit ship:"
    input = gets.chomp.upcase.split(" ")
    @user.add_ship(input)
    print "Enter the squares for the three-unit ship:"
    input = gets.chomp.upcase.split(" ")
    @user.add_ship(input)
    turn()
  end

  def turn()
    puts "Here's a map of your enemy!"
    @comp.display
    print "Enter your attack!"
    input = gets.chomp.upcase
    comp.attack(input)
    @comp.display
    computer_turn()
    binding.pry
    turn()
  end

  def computer_turn()

  end








end

battleship = Battleship.new()
battleship.intro
