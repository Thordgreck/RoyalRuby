require_relative 'Room.rb'
require_relative 'Item.rb'
require_relative 'Door.rb'
require_relative 'Wall.rb'
require_relative 'Direction.rb'
require_relative 'Input.rb'
require_relative 'Player.rb'
require_relative 'Games.rb'
require_relative 'Enemy.rb'

class Game
  def initialize(player)
    @x = 0
    @y = 0
    @player = player
    @rooms = Array.new
    @current = nil
  end

  def getRoom(x, y, dir)
    if !dir.nil?
      if Direction.value(dir) == Direction::NORTH
        y += 1
      elsif Direction.value(dir) == Direction::SOUTH
        y -= 1
      elsif Direction.value(dir) == Direction::EAST
        x += 1
      elsif Direction.value(dir) == Direction::WEST
        x -= 1
      end
    end
    @rooms.each{ |room|
      if room.hasCoord(x, y)
        return room
      end
    }
    nil
  end

  def getRoomParams()
    retval = Array.new
    Direction.each do |key_, value|
      room = getRoom(@x, @y, key_)
      if room.nil?
        retval << nil
      else
        retval << room.getInitParams(key_)
      end
    end
    retval
  end

  def mainloop()
    while !@player.isDead && !@player.hasWon
      if (@current.nil?)
        puts "Created room at " + @x.to_s + " " + @y.to_s
        @current = Room.new(@x, @y, getRoomParams())
        @rooms << @current
      end
      puts "Went in room " + @x.to_s + " " + @y.to_s
      @current.describe()
      r = rand(3)
      # if r == 3
      if r <= 3
        enemy = EnemyFactory.new()
        enemy.fight(@player)
      end
      if @player.isDead
        return
      end
      #loot
      can_move = FALSE
      direction = nil
      while !can_move
        puts "Select a direction in the availables: "
        @current.availableDoors()
        direction = get_direction()
        if @current.canMove(direction)
          can_move = @current.tryMove(direction, @player)
        end
      end
      @current = getRoom(@x, @y, direction)
      if Direction.value(direction) == Direction::NORTH
        @y += 1
      elsif Direction.value(direction) == Direction::SOUTH
        @y -= 1
      elsif Direction.value(direction) == Direction::EAST
        @x += 1
      elsif Direction.value(direction) == Direction::WEST
        @x -= 1
      end
    end
  end
end

again = TRUE
while again
  player = Player.new()
  game = Game.new(player)
  game.mainloop()
  again = ask_new_game()
end
