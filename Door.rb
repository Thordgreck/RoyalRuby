class Door
    def initialize()
        @name = "Default Door"
        @desc = "Default Door"
        @helpDesc = "Default Door"
        print("Door Class\n")
        
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
    
    def describe()
        print(@desc)
    end
    
    def help()
        print(@helpDesc)
    end
    
    class NormalDoor
        @name = "Door"
        @desc = "A normal wood door."
        @helpDesc = "Just a normal door, nothing more."
    end
    
    class BrokenDoor
        @name = ""
        @desc = ""
        @helpDesc = ""
    end
    
    class StuckDoor
        @name = "Stuck door"
        @desc = "This door seems to be stuck, if you get closer, you can try to open it."
        @helpDesc = "Launch a coinflip when you try to pass, if you lose, the door stay stuck."
    end
    
    class TrapDoor
        @name = "Trap door"
        @desc = "There is some trap around the door. Care can hurt !"
        @helpDesc = "Launch a coinflip when you pass throught, if you lose : -1Hp."
    end
    
    class LockedDoor
        @name = "Locked door"
        @desc = "From the middle of the room you can see a locket and a passcode on this door."
        @helpDesc = "If you have a key, you can use it to open the door. Or you can try to find the passcode for the door."
    end
end
