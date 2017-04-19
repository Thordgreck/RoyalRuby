class Wall
    def Wall.new()

        x = rand(10) + 1
        if x <= 6
            NormalWall.new()
        elsif x > 6 and x <= 8
            SkullWall.new()
        elsif x > 8
            BrokenWall.new()
        end

    end

    class NormalWall
        def initialize()
            @name = "Wall"
            @desc = "A normal wall."
            @helpDesc = "You realy need help for this?"
        end

        def describe()
            print(@desc + "\n")
        end

        def help()
            print(@helpDesc + "\n")
        end
    end

    class SkullWall
        def initialize()
            @name = "Skull Wall"
            @desc = "A wall full of skulls, they may have some stuff left on them."
            @helpDesc = "Increase your loot chance in the room."
        end

        def describe()
            print(@desc + "\n")
        end

        def help()
            print(@helpDesc + "\n")
        end
    end

    class BrokenWall
        def initialize()
            @name = "Broken Wall"
            @desc = "This wall seems craked, try to use your hammer to break it."
            @helpDesc = "Dwarf hammer! Nothing more to say!"
        end

        def describe()
            print(@desc + "\n")
        end

        def help()
            print(@helpDesc + "\n")
        end
    end
end
