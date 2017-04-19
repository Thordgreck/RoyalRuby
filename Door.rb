class Door
    def initialize()
        print("Door Class\n")
        
        x = rand(10) + 1
        if x <= 4
            door.initialize()
        elsif x > 4 and x <= 6
            stuckDoor.initialize()
        elsif x > 6 and x <= 8
            trapDoor.initialize()
        elsif x > 8
            lockedDoor.initialize()
        end
    end
    
    def describe()
        print(@description)
    end
    
    class NormalDoor
        @name = "Door"
        @description = "A normal wood door."
    end
    
    class BrokenDoor
        @name = ""
        @description = ""
    end
    
    class StuckDoor
        @name = "Stuck door"
        @description = "This door seems to be stuck, if you get closer, you can try to open it."
    end
    
    class TrapDoor
        @name = "Trap door"
        @description = "There is some trap around the door. Care can hurt !"
    end
    
    class LockedDoor
        @name = "Locked door"
        @description = "From the middle of the room you can see a locket and a passcode on this door."
    end
end
