require_relative 'Door.rb'
require_relative 'Wall.rb'

class Room
  def initialize(x, y, rooms)
    @x = x
    @y = y
    @searched = FALSE
    @walls = Array.new(4) {nil}
    @doors = Array.new(4) {nil}
    rooms.each_with_index { |room, i|
      if !room.nil?
        walls[i] = room[0]
        doors[i] = room[1]
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
        puts 'Created door ' + i.to_s
      end
    }
  end

  def hasCoord(x, y)
    x == @x && y == @y
  end

  def getInitParams(dir)
    [@walls[(Direction.value(direction) + 2) % 4], @doors[(Direction.value(direction) + 2) % 4]]
  end

  def describe()
    dirs = ["north", "east", "south", "west"]
    dirs.each_with_index{ |direction, i|
      print "In the " + direction + " of the room you can see a wall:\n\t"
      @walls[i].describe()
      if (!@doors[i].nil?)
        print "    You can also see a door:\n      "
        @doors[i].describe()
      end
      puts
    }
  end

  def availableDoors()
    puts
    dirs = ["north", "east", "south", "west"]
    dirs.each_with_index{ |direction, i|
      if (!@doors[i].nil?)
        puts @doors[i].name() + " in the " + direction + " (guess what letter you should type!) (hint: " + direction[0] + ")"
      end
    }
    puts
  end

  def canMove(direction)
    if @doors[Direction.value(direction)] != nil
      return TRUE
    end
    return FALSE
  end

  def tryMove(direction, player)
    @doors[Direction.value(direction)].tryMove(player)
  end
end
