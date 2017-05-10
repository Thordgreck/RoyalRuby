require_relative 'Door.rb'
require_relative 'Wall.rb'

class RoomFactory
  @@is_treasure_room = FALSE
  @@rooms = Array.new
  @@number_of_free_door = 1
  def initialize()

  end
  def RoomFactory.newRoom(x, y)
    @@number_of_free_door -= 1
    room_params = getRoomParams(x, y)
    r = rand(60) + 1
    room = nil
    while room == nil
      if (r == 60)
        if @is_treasure_room
          ExitRoom.new(x, y, room_params)
        else
          @@is_treasure_room = TRUE
          room = TreasureRoom.new(x, y, room_params)
        end
      else
        room = Room.new(x, y, room_params)
      end
      if @@number_of_free_door == 0
        room = nil
      end
    end
    room
  end

  def RoomFactory.add_free_doors(nb)
    @@number_of_free_door += nb
  end

  def RoomFactory.getRoom(x, y, dir)
    if !dir.nil?
      if dir == Direction::NORTH
        y += 1
      elsif dir == Direction::SOUTH
        y -= 1
      elsif dir == Direction::EAST
        x += 1
      elsif dir == Direction::WEST
        x -= 1
      end
    end
    @@rooms.each{ |room|
      if room.hasCoord(x, y)
        return room
      end
    }
    nil
  end

  def RoomFactory.add_room(room)
    @@rooms << room
  end

  def RoomFactory.getRoomParams(x, y)
    retval = Array.new
    Direction.each do |key_, value|
      room = getRoom(x, y, value)
      if room.nil?
        retval << nil
      else
        retval << room.getInitParams(key_)
      end
    end
    retval
  end
end

class Room
  attr_accessor :x
  attr_accessor :y

  def initialize(x, y, room_params)
    @x = x
    @y = y
    @searched = FALSE
    @walls = Array.new(4) {nil}
    @doors = Array.new(4) {nil}
    room_params.each_with_index { |room, i|
      if !room.nil?
        @walls[i] = room[0]
        @doors[i] = room[1]
        RoomFactory.add_free_doors(-@doors[i].free_door())
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
        RoomFactory.add_free_doors(@doors[i].free_door())
        puts ('Created door ' + i.to_s).white()
      end
    }
    @is_loot = FALSE
  end

  def hasCoord(x, y)
    # puts @x, @y
    x == @x && y == @y
  end

  def getInitParams(dir)
    [@walls[(Direction.value(dir) + 2) % 4], @doors[(Direction.value(dir) + 2) % 4]] #return the wall and door in commum with the room on the opposite direction of @dir
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
    avail = []
    dirs = ["north", "east", "south", "west"]
    dirs.each_with_index{ |direction, i|
      if (!@doors[i].nil?)
        puts @doors[i].name() + " in the " + direction + " (press: " + direction[0] + ")"
        avail << i
      end
    }
    puts
    avail
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



class ExitRoom < Room

end

class TreasureRoom < Room
    def describe()
      puts "you are in the TreasureRoom".cyan()
    end
end
