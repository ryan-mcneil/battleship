class Peg
  attr_reader :ship, :state

  def initialize()
    @ship = false
    @state = ""
  end

  def set_ship
    @ship = true
  end

  def hit()
    @state = "H"
    "HIT!"
  end

  def miss()
    @state = "M"
    "MISS!"
  end


end
