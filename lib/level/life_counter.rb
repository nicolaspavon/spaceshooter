class LifeCounter
  MARGIN_INTERNAL_X = 4
  MARGIN_LEFT       = 10
  MARGIN_TOP        = 10
  def initialize
    @lifes = 5
    @image = Gosu::Image.new('media/images/power.png')
  end
  def draw
    @lifes.times do |posicion|
      x = MARGIN_LEFT + posicion * (@image.width + MARGIN_INTERNAL_X)
      @image.draw(x, MARGIN_TOP, 1)
    end
  end
end
