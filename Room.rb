require_relative 'Door.rb'
require_relative 'Wall.rb'

class RoomFactory

  def initialize
    @@is_treasure_room = FALSE
  end
  def RoomFactory.newRoom(x, y, rooms)
    r = rand(60) + 1
    if (r == 60)
      if @is_treasure_room
        ExitRoom.new(x, y, rooms)
      else
        TreasureRoom.new(x, y, rooms)
        @@is_treasure_room = TRUE
      end
    end
    Room.new(x, y, rooms)

  end
end

class Room
  def initialize(x, y, rooms)
    @x = x
    @y = y
    @searched = FALSE
    @walls = Array.new(4) {nil}
    @doors = Array.new(4) {nil}
    rooms.each_with_index { |room, i|
      if !room.nil?
        @walls[i] = room[0]
        @doors[i] = room[1]
      end
    }
    @walls.each_with_index{ |wall, i|
      if !wall.nil?
        next
      end
      @walls[i] = WallFactory.new()
    }
    @doors.each_with_index{ |door, i|
      if !door.nil?
        next
      end
      if rand(3) < 2
        @doors[i] = DoorFactory.newDoor()
        puts ('Created door ' + i.to_s).grey()
      end
    }
    @is_loot = FALSE
  end

  def hasCoord(x, y)
    x == @x && y == @y
  end

  def getInitParams(dir)
    [@walls[(Direction.value(dir) + 2) % 4], @doors[(Direction.value(dir) + 2) % 4]]
  end

  def describe()
    dirs = ["north", "east", "south", "west"]
    dirs.each_with_index{ |direction, i|
      print(("In the " + direction + " of the room you can see a wall:\n\t").green())
      puts @walls[i].describe().green()
      if (!@doors[i].nil?)
        print("    You can also see a door:\n      ".green())
        puts @doors[i].describe().green()
      end
      puts
    }
  end

  def availableDoors()
    puts
    dirs = ["north", "east", "south", "west"]
    dirs.each_with_index{ |direction, i|
      if (!@doors[i].nil?)
        puts @doors[i].name() + " in the " + direction + " (hint: " + direction[0] + ")"
      end
    }
    puts
  end

  def canMove(direction)
    if @doors[direction] != nil
      return TRUE
    end
    return FALSE
  end

  def tryMove(direction, player)
    @doors[direction].tryMove(player)
  end

  def loot(player, monster_killed)
    if(!@is_loot)
      @is_loot = TRUE
      player.add_item(1.0/7.0*100.0)
      @walls.each{ |wall|
        player.add_item(wall.get_loot_probability())
      }
    end
    if(monster_killed)
      player.add_item(4.0/7.0*100.0)
    end
    puts "You've searched everywhere.".yellow()
  end
end



class ExitRoom

end

class TreasureRoom

end
