require_relative 'Door.rb'
require_relative 'Wall.rb'

class Room
  def initialize(needed_doors, blocked_doors)
    @walls = Array.new(4) {Wall.new()}
    @doors = Array.new(4)
    fulfil_needed = FALSE
    @doors.each_with_index{ |door, i|
      if blocked_doors.include? i
        next
      end
      x = rand(3)
      if x < 2 || (i == needed_doors.last && fulfil_needed == FALSE)
        @doors[i] = DoorFactory.newDoor()
        puts 'Created door ' + i.to_s
        if needed_doors.include? i
          fulfil_needed = TRUE
        end
      end
    }
    if !fulfil_needed
      puts "!!!\n!!!\n ERROR: Needed doors error, using " + needed_doors.to_s + " and " + blocked_doors.to_s + "\n!!!\n!!!"
    end
    @searched = FALSE
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

  def tryMove(direction)
    @doors[Direction.value(direction)].tryMove()
  end
end
