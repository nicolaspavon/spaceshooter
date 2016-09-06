require_relative'player_ship'

class Level
  def initialize(window)
    @player = PlayerShip.new
    @window = window
  end

  def update
    @player.move_up! if @window.button_down?(Gosu::KbUp)
    @player.move_down! if @window.button_down?(Gosu::KbDown)
  end

  def draw
    @player.draw
  end



  def button_down(id)
    case id
      when Gosu::KbEscape
        @window.show_main_menu
      end

  end
end
