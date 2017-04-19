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
      @cases[x][y] = Room.new([0, 1], [2, 3])
      puts "Created room at " + x.to_s + " " + y.to_s
    end
    puts "Went in room " + x.to_s + " " + y.to_s
    @cases[x][y].describe()
    r = rand(3)
    # if r == 3
    if r <= 3
      enemy = Enemy.new()
      enemy.fight(player)
    end
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
    while !@player.isDead && !@player.hasWon
      @maze.room(@x, @y, @player)
    end
  end
end

size_tab = ask_param()
maze = Maze.new(size_tab[0], size_tab[1])
again = TRUE
while again
  player = Player.new()
  game = Game.new(maze, player)
  game.mainloop()
  again = ask_new_game()
end
