class DoorFactory
  def DoorFactory.newDoor() # That's how you do a Factory (biatch) #guigui
    x = rand(10) + 1
    if x <= 4
      NormalDoor.new()
    elsif x > 4 and x <= 6
      StuckDoor.new()
    elsif x > 6 and x <= 8
      TrapDoor.new()
    elsif x > 8
      LockedDoor.new()
    end
  end

end
class Door
  @name
  @desc
  @helpDesc
  def name()
    @name
  end
  def describe()
    print(@desc + "\n")
  end
  def help()
    print(@helpDesc + "\n")
  end
  def tryMove()
    TRUE
  end
end

class NoDoor < Door
  def initialize()
    @name = ""
    @desc = ""
    @helpDesc = ""
  end
end

class NormalDoor < Door
  def initialize()
    @name = "Door"
    @desc = "A normal wood door."
    @helpDesc = "Just a normal door, nothing more."
  end
end

class BrokenDoor < Door
  def initialize()
    @name = ""
    @desc = ""
    @helpDesc = ""
  end
end

class StuckDoor < Door
  def initialize()
    @name = "Stuck door"
    @desc = "This door seems to be stuck, if you get closer, you can try to open it."
    @helpDesc = "Launch a coin flip when you try to pass, if you lose, the door stay stuck."
  end
end

class TrapDoor < Door
  def initialize()
    @name = "Trap door"
    @desc = "There is some trap around the door. Care, can hurt!"
    @helpDesc = "Launch a coin flip when you pass through, if you lose: -1Hp."
  end
end

class LockedDoor < Door
  def initialize()
    @name = "Locked door"
    @desc = "From the middle of the room, you can see a locket and a passcode on this door."
    @helpDesc = "If you have a key, you can use it to open the door. Or you can try to find the passcode for the door."
  end
end
