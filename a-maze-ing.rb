require_relative 'Room.rb'
require_relative 'Item.rb'
require_relative 'Door.rb'
require_relative 'Wall.rb'

class Maze
  def initialize(length, height)
    print("Yay" + "\n")
  end
  def enter(direction)
    if (["N", "E", "S", "W"].include?direction)
      print("You entered through the entrance " + direction + "\n")
    else
      print("No such entrie " + direction + "\n")
    end
  end
end

class MazeFactory
  def make_maze(length, height)
    return Maze.new(length, height)
  end

  def make_room(x, y)
    return Room.new(x, y)
  end

  def make_door(r1, r2)
    return Door.new(r1, r2)
  end

  def make_wall(r1, r2)
    return Wall.new(r1, r2)
  end
end

def make_maze(x_size, y_size)
  factory = MazeFactory.new()
  m = factory.make_maze(x_size, y_size)
end

maze = make_maze(5, 6)
maze.enter("flop")
maze.enter("N")
