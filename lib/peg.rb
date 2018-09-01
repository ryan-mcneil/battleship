class Peg
  attr_reader :is_ship, :state

  def initialize()
    @is_ship = false
    @state = ""
  end

  def set_ship
    @is_ship = true
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
