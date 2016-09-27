require_relative'player_ship'
require_relative'score'
require_relative'life_counter'
require_relative'enemy_ship'

class Level
  def initialize(window, enemy_ship_definitions)
    @player = PlayerShip.new
    @window = window
    @lasers = []
    @score = Score.new
    @lifeCounter = LifeCounter.new
    @enemy_ships = []
    @enemy_ship_definitions = enemy_ship_definitions

  end

  def update
    @player.move_up! if @window.button_down?(Gosu::KbUp)
    @player.move_down! if @window.button_down?(Gosu::KbDown)
    unless @lasers.nil? || @lasers.empty?
      @lasers.each { |laser| laser.move!}
      @lasers.reject! { |laser| laser.is_out?}
    end
    create_enemy_ship
    unless @enemy_ships.nil? || @enemy_ships.empty?
      @enemy_ships.each {|enemy_ship| enemy_ship.move!}
    end

  end

  def draw
    @player.draw
    @score.draw
    @lifeCounter.draw
    unless @lasers.nil? || @lasers.empty?
      @lasers.each {|laser| laser.draw}
    end
    unless @enemy_ships.nil? || @enemy_ships.empty?
      @enemy_ships.each {|enemy| enemy.draw}
    end
  end

  def button_down(id)
    case id
      when Gosu::KbEscape
        @window.show_main_menu
      when Gosu::KbSpace
        laser = @player.shoot!
        @lasers << laser
      end

  end

  def create_enemy_ship
    current_time = Gosu::milliseconds
    if @last_enemy_ship_at.nil? || (@last_enemy_ship_at + time_between_enemy_ships < current_time)
      @last_enemy_ship_at = current_time
      info = @enemy_ship_definitions.sample
      @enemy_ships << EnemyShip.new(info[:image_path], info[:points], info[:velocity])
    end
  end

  def time_between_enemy_ships
    case @score.points
      when 0..1000
        3000
      when 1000..2000
        2000
      else
        1000
    end
  end

end
