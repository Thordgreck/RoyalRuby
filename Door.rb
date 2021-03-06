class DoorFactory
    def DoorFactory.newDoor()
        x = rand(10) + 1
        if x <= 4 # 4/10
            NormalDoor.new()
        elsif x <= 6 # 2/10
            StuckDoor.new()
        elsif x <= 9 # 3/10
            TrapDoor.new()
        elsif x <= 10 # 1/10
            LockedDoor.new()
        end
    end
end

class Door
    @name
    @desc
    @helpDesc
    @open
    @block

    def name()
        @name
    end

    def describe()
        @desc
    end

    def help()
        @helpDesc
    end

    def tryMove(player)

    end

    def free_door()
      1
    end
end

class NoDoor < Door
    def initialize()
        @name = ""
        @desc = ""
        @helpDesc = ""
        @open = FALSE
        @block = FALSE
    end

    def tryMove(player)
        FALSE
    end
end

class NormalDoor < Door
    def initialize()
        @name = "Door"
        @desc = "A normal wood door."
        @helpDesc = "Just a normal door, nothing more."
        @open = FALSE
        @block = FALSE
    end

    def tryMove(player)
        TRUE
    end
end

class BrokenDoor < Door
    def initialize()
        @name = "Crack"
        @desc = "There seems to be a crack in this wall, with the correct tools you may open it."
        @helpDesc = "Use a hammer to break it!"
        @open = FALSE
        @block = FALSE
    end

    def tryMove(player)
        if @open == FALSE
            breakWall = player.useHammer()
            @open = breakWall
            @name = "Big hole"
            @desc = "You already broke this wall, you can pass easily."
            @helpDesc = "Just pass"
        end

        if @open == TRUE
            TRUE
        else
            FALSE
        end
    end
end

class StuckDoor < Door
    def initialize()
        @name = "Stuck door"
        @desc = "This door seems to be stuck, if you get closer, you can try to open it."
        @helpDesc = "Launch a coin flip when you try to pass, if you lose, the door stay stuck."
        @open = FALSE
        @block = FALSE
    end

    def free_door()
      0
    end

    def tryMove(player)
        if @open == TRUE
            TRUE
        elsif @block == TRUE
            print("This door is block. Choose another door.\n")
            FALSE
        else
            x = rand(2)
            if x == 0
                @block = TRUE
                print("You try to open the door but it seems stuck, try another way.\n")
                FALSE
            else
                @open = TRUE
                print("Oh you open the door.\n")
                TRUE
            end
        end
    end
end

class TrapDoor < Door
    def initialize()
        @name = "Trap door"
        @desc = "There is some trap around the door. Care, can hurt!"
        @helpDesc = "Launch a coin flip when you pass through, if you lose: -1Hp."
        @open = FALSE
        @block = FALSE
    end

    def tryMove(player)
        if @open == TRUE
            TRUE
        else
            @open = TRUE
            x = rand(2)
            if x == 0
                player.takeDamage(1, TRUE)
            end
            TRUE
        end
    end
end

class LockedDoor < Door
    def initialize()
        @name = "Locked door"
        @desc = "From the middle of the room, you can see a locket on this door."
        @helpDesc = "If you have a key, you can use it to open the door. Or you can try to find the passcode for the door."
        @open = FALSE
        @block = FALSE
    end

    def tryMove(player)
        if @open == TRUE
            TRUE
        elsif player.haveKey() > 0
            player.useKey()
            print("You use a key and pass succeed to open this door. #{player.haveKey()} key left.\n")
            @open = TRUE
            @name = "Unocked door"
            @desc = "From the middle of the room, you can see a locket on this opened door."
            @helpDesc = "It's open, just go!"

            TRUE
        else
            print("You don't have any key, you may look for one or choose another direction\n")
            FALSE
        end
    end
end
