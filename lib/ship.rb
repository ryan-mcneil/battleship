class Ship
  attr_reader :coords, :hits

  def initialize(coords)
    @coords = coords
    @hits = 0

  end

  def hit
    @hits += 1
  end

  def sunk?
    @hits == coords.length
  end
  
end
