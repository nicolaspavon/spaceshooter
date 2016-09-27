
class Score
  MARGIN_TOP = 10
  MARGIN_RIGHT = 120
  attr_reader :points

  def initialize
    @points = 0
    @text = Gosu::Font.new(40, name: Utils.default_font)
    @x = Game::SCREEN_WIDTH-MARGIN_RIGHT
  end
  def draw
    @text.draw @points, @x, MARGIN_TOP, 1

  end

end
