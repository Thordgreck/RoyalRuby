class Wall
    def initialize()
        print("Wall Class\n")
        
        x = rand(10) + 1
        if x <= 6
            NormalWall.new()
        elsif x > 6 and x <= 8
            SkullWall.new()
        elsif x > 8
            BrokenWall.new()
        end
    end
    
    def describe()
       print(@desc)
    end
    
    def help()
       print(@helpDesc)
    end
    
    class NormalWall
        def initialize()
            @name = "Wall"
            @desc = "A normal wall."
            @helpDesc = "You realy need help for this?"
            print("Init Wall\n")
        end
    end
    
    class SkullWall
        def initialize()
            @name = "Skull Wall"
            @desc = "A wall full of skull, they may have some stuff left on them."
            @helpDesc = "Increase your loot chance in the room."
            print("Init Skull Wall\n")
        end
    end
    
    class BrokenWall
        def initialize()
            @name = "Broken Wall"
            @desc = "This wall seems craked, try to use your hammer to break it."
            @helpDesc = "Dwarf hammer! Nothing more to say!"
            print("Init Broken Wall\n")
        end
    end
end
