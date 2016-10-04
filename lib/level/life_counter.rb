class LifeCounter
  MARGIN_INTERNAL_X = 4
  MARGIN_LEFT       = 10
  MARGIN_TOP        = 10
  def initialize
    @lifes = 1
    @image = Gosu::Image.new('media/images/power.png')
    @lost_life_sound = Gosu::Sample.new('media/sounds/lost_life.ogg')
  end
  def draw
    @lifes.times do |posicion|
      x = MARGIN_LEFT + posicion * (@image.width + MARGIN_INTERNAL_X)
      @image.draw(x, MARGIN_TOP, 1)
    end
  end
  def lose_life!
    @lifes -= 1
    @lost_life_sound.play
  end
  def game_over?
    @lifes == 0
  end
end
