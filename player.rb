class Player
  attr_accessor :name, :score, :lives

  def initialize(name)
    @name = name
    @score = 0
    @lives = 3
  end

  def update_score(point)
    @score += point
  end

  def update_lives(life)
    @lives -= life
  end
end

player1 = Player.new('player1')
