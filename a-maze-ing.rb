require_relative 'Room.rb'
require_relative 'Item.rb'
require_relative 'Door.rb'
require_relative 'Wall.rb'
require_relative 'Direction.rb'
require_relative 'Input.rb'
require_relative 'Player.rb'
require_relative 'Games.rb'
require_relative 'Enemy.rb'

class Maze
  def initialize(length, height)
    @cases = Array.new(length) {Array.new(height) {nil}}
    @length = length
    @height = height
    puts 'Created maze of width ' + length.to_s + " and height " + height.to_s
  end

  def room(x, y, player)
    if (@cases[x][y].nil?)
      @cases[x][y] = Room.new([1])
      puts "Created room at " + x.to_s + " " + y.to_s
      r = rand(10)
      # if r == 9
      if r <= 9
        enemy = Enemy.new()
        enemy.fight(player)
      end
    end
    puts "Went in room " + x.to_s + " " + y.to_s
    @cases[x][y].describe()
  end
end

class Game
  def initialize(maze, player)
    @x = 0
    @y = 0
    @maze = maze
    @player = player
  end
  def mainloop()
    @maze.room(@x, @y, @player)
    game = Rps.new()
    game.play()
  end
end

size_tab = ask_param()
maze = Maze.new(size_tab[0], size_tab[1])
player = Player.new()
game = Game.new(maze, player)
game.mainloop()
