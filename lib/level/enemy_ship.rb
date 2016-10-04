require_relative 'life_counter'
class EnemyShip
  attr_accessor :points
  def initialize(image_path, points, velocity)
    @points = points
    @velocity = velocity
    @image = Gosu::Image.new("media/images/enemies/#{image_path}")
    @x = Game::SCREEN_WIDTH - @image.width
    @y = Random.rand(Game::SCREEN_HEIGHT - @image.height)
    @destroyed = false
  end
  def draw
    @image.draw(@x, @y, 1)
  end
  def move!
    @x -= @velocity
  end
  def is_out?
    @x < 0 - @image.height
  end
  def was_hit?(lasers)
    lasers.any? { |laser| hit?(laser) }
  end
  def destroy!
    @destroyed = true
  end
  def destroyed?
    @destroyed
  end
  private
  def hit?(laser)
    laser_top = laser.y
    laser_bottom = laser.y + laser.height
    laser_left = laser.x
    laser_right = laser.x + laser.width

    space_ship_top = @y
    space_ship_bottom = @y + @image.height
    space_ship_left = @x
    space_ship_right = @x + @image.width

    if space_ship_top > laser_bottom
      false
    elsif space_ship_bottom < laser_top
      false
    elsif space_ship_left > laser_right
      false
    elsif space_ship_right < laser_left
      false
    else
      true
    end

  end

end
