class Door
    def initialize()
        @name = "Default Door"
        @desc = "Default Door"
        @helpDesc = "Default Door"
        
        x = rand(10) + 1
        if x <= 4
            @door = NormalDoor.new()
        elsif x > 4 and x <= 6
            @door = StuckDoor.new()
        elsif x > 6 and x <= 8
            @door = TrapDoor.new()
        elsif x > 8
            @door = LockedDoor.new()
        end
        
        @door
    end
    
    def describe()
        @door.describe()
    end
    
    def help()
        @door.help()
    end
    
    class NormalDoor
        def initialize()
            @name = "Door"
            @desc = "A normal wood door."
            @helpDesc = "Just a normal door, nothing more."
        end
        
        def describe()
            print(@desc + "\n")
        end
        
        def help()
            print(@helpDesc + "\n")
        end
    end
    
    class BrokenDoor
        def initialize()
            @name = ""
            @desc = ""
            @helpDesc = ""
        end
        
        def describe()
            print(@desc + "\n")
        end
        
        def help()
            print(@helpDesc + "\n")
        end
    end
    
    class StuckDoor
        def initialize()
            @name = "Stuck door"
            @desc = "This door seems to be stuck, if you get closer, you can try to open it."
            @helpDesc = "Launch a coinflip when you try to pass, if you lose, the door stay stuck."
        end
        
        def describe()
            print(@desc + "\n")
        end
        
        def help()
            print(@helpDesc + "\n")
        end
    end
    
    class TrapDoor
        def initialize()
            @name = "Trap door"
            @desc = "There is some trap around the door. Care can hurt !"
            @helpDesc = "Launch a coinflip when you pass throught, if you lose : -1Hp."
        end
        
        def describe()
            print(@desc + "\n")
        end
        
        def help()
            print(@helpDesc + "\n")
        end
    end
    
    class LockedDoor
        def initialize()
            @name = "Locked door"
            @desc = "From the middle of the room you can see a locket and a passcode on this door."
            @helpDesc = "If you have a key, you can use it to open the door. Or you can try to find the passcode for the door."
        end
        
        def describe()
            print(@desc + "\n")
        end
        
        def help()
            print(@helpDesc + "\n")
        end
    end
end
