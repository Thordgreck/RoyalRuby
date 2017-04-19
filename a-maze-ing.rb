require_relative 'Room.rb'
require_relative 'Item.rb'
require_relative 'Door.rb'
require_relative 'Wall.rb'
require_relative 'Direction.rb'
require_relative 'Input.rb'

class Maze
  def initialize(length, height)
    @cases = Array.new(length) {Array.new(height)}
  end
  def enter()
    direction = get_direction()
  end
end

x_size = 9
y_size = 9
maze = Maze.new(x_size, y_size)
maze.enter()
