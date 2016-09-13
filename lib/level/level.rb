require_relative'player_ship'
require_relative'score'

class Level
  def initialize(window)
    @player = PlayerShip.new
    @window = window
    @lasers = []
    @score = Score.new

  end

  def update
    @player.move_up! if @window.button_down?(Gosu::KbUp)
    @player.move_down! if @window.button_down?(Gosu::KbDown)
    unless @lasers.nil? || @lasers.empty?
      @lasers.each { |laser| laser.move!}
      @lasers.reject! { |laser| laser.is_out?}
    end
  end

  def draw
    @player.draw
    @score.draw
    unless @lasers.nil? || @lasers.empty?
      @lasers.each {|laser| laser.draw}
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
end
