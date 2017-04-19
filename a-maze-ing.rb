require_relative 'Room.rb'
require_relative 'Item.rb'
require_relative 'Door.rb'
require_relative 'Wall.rb'
require_relative 'Direction.rb'
require_relative 'Input.rb'
require_relative 'Player.rb'

class Maze
  def initialize(length, height)
    @cases = Array.new(length) {Array.new(height)}
    @length = length
    @height = height
    p "got params " + length.to_s + " " + height.to_s
  end
  def room(x, y, player)
    p "Went in room " + x.to_s + " " + y.to_s + "\n"
  end
end

class Game
  def initialize(maze, player)
    p "Too lazy to start"
    @x = 0
    @y = 0
    @maze = maze
    @player = player
  end
  def mainloop()
    @maze.room(@x, @y, @player)
    p "Bon bah c'est sense y avoir un jeu la mais voila hein oh c'est bon hein\n"
  end
end

x_size = 9
if (!ARGV[0].nil?)
  x_size = ARGV[0].to_i
end
y_size = 9
if (!ARGV[1].nil?)
  y_size = ARGV[1].to_i
end
maze = Maze.new(x_size, y_size)
player = Player.new()
game = Game.new(maze, player)
game.mainloop()
