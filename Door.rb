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
    
    def help()
        print(@helpDesc)
    end
    
    class NormalDoor
        @name = "Door"
        @description = "A normal wood door."
        @helpDesc = "Just a normal door, nothing more."
    end
    
    class BrokenDoor
        @name = ""
        @description = ""
        @helpDesc = ""
    end
    
    class StuckDoor
        @name = "Stuck door"
        @description = "This door seems to be stuck, if you get closer, you can try to open it."
        @helpDesc = "Launch a coinflip when you try to pass, if you lose, the door stay stuck."
    end
    
    class TrapDoor
        @name = "Trap door"
        @description = "There is some trap around the door. Care can hurt !"
        @helpDesc = "Launch a coinflip when you pass throught, if you lose : -1Hp."
    end
    
    class LockedDoor
        @name = "Locked door"
        @description = "From the middle of the room you can see a locket and a passcode on this door."
        @helpDesc = "If you have a key, you can use it to open the door. Or you can try to find the passcode for the door."
    end
end
