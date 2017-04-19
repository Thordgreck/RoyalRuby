require_relative 'Room.rb'
require_relative 'Item.rb'
require_relative 'Door.rb'
require_relative 'Wall.rb'
require_relative 'Direction.rb'
require_relative 'Input.rb'

class Maze
  def initialize(length, height)
    @cases = Array.new(length) {Array.new(height)}
    @length = length
    @height = height
    p "got params " + length.to_s + " " + height.to_s
  end
  def enter()
    direction = get_direction()

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
maze.enter()
