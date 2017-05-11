#!/usr/bin/env ruby

require_relative 'Room.rb'
require_relative 'Item.rb'
require_relative 'Door.rb'
require_relative 'Wall.rb'
require_relative 'Direction.rb'
require_relative 'Input.rb'
require_relative 'Player.rb'
require_relative 'Games.rb'
require_relative 'Enemy.rb'
require_relative 'colorize.rb'

class Game
  def initialize(player)
    @x = 0
    @y = 0
    @player = player
    @current = nil
    @dragon = 0
  end



  def mainloop()
    while !@player.isDead && !@player.hasWon
      if (@current.nil?)
        puts ("Created room at " + @x.to_s + " " + @y.to_s).white()
        @current = RoomFactory.newRoom(@x, @y)
        RoomFactory.add_room(@current)
      end
      puts ("Went in room " + @x.to_s + " " + @y.to_s).white()
      @current.describe()
      if @dragon >= 1
        @dragon -= 1
        puts "The dragon attacks you!!!".red()
        @player.takeDamage(1, TRUE)
      end
      if @player.isDead
        return
      end
      r = rand(3)
      fought_monster = FALSE
      if r < 2
        enemy = EnemyFactory.new()
        enemy.fight(@player)
        fought_monster = TRUE
      end
      if @player.isDead
        return
      end
      puts "You look around in the room, maybe you will find something?".yellow()
      @current.loot(@player, fought_monster)
      if(!@player.inventory.empty?)
        puts "Do you want to see your inventory (y/N)?".magenta()
        if (result = ask_yes_not())
          puts
          @player.use_inventory()
        end
      end
      puts
      can_move = FALSE
      direction = nil
      avail = @current.availableDoors()
      while !can_move
        puts "Select a direction in the availables: ".magenta()
        direction = @player.chooseDirection(avail)
        if @current.canMove(direction)
          can_move = @current.tryMove(direction, @player)
        end
      end
      @current = RoomFactory.getRoom(@x, @y, direction)
      if direction == Direction::NORTH
        @y += 1
      elsif direction == Direction::SOUTH
        @y -= 1
      elsif direction == Direction::EAST
        @x += 1
      elsif direction == Direction::WEST
        @x -= 1
      end
    end
  end
end

again = TRUE
print("---> INTRO TEXT\n")
while again
  player = Player.new()
  game = Game.new(player)
  game.mainloop()
  again = ask_new_game()
end
