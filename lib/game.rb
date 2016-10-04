require 'gosu'
require 'csv'
require_relative 'menu/main_menu'
require_relative 'level/level'
require_relative 'utils'
require_relative 'level/game_over'

class Game < Gosu::Window

  SCREEN_WIDTH = 1024
  SCREEN_HEIGHT = 600

  def initialize
    super(SCREEN_WIDTH, SCREEN_HEIGHT, fullscreen: false)
    self.caption = "SpaceShooter"
    @enemy_ship_definitions = load_enemy_ship_definitions
    @main_menu = MainMenu.new(self)
    @current_screen = @main_menu


  end

  def update
    @current_screen.update
  end
  def show_main_menu
    @current_screen = @main_menu

  end

  def show_level
    @current_screen = Level.new(self, @enemy_ship_definitions)
  end

  def button_down(id)
    @current_screen.button_down(id)
  end

  def draw
    @current_screen.draw


  end

  def load_enemy_ship_definitions
    file_content = File.read('enemy_ships.csv')
    rows = CSV.parse(file_content)
    rows.map do |row|
      {image_path: row[0], name: row[1], points: row[2].to_i, velocity: row[3].to_i}
    end
  end

  def show_game_over(points)
    @current_screen = GameOver.new(self, points)

  end
end
