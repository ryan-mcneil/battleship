class Ship
  attr_reader :length, :hits

  def initialize(length)
    @length = length
    @hits = 0
  end

  def hit
    @hits += 1
  end

  def sunk?
    @hits == length
  end
end
