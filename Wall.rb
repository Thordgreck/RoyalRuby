class Wall
    def initialize()
        print("Wall Class\n")
        
        x = rand(10) + 1
        if x <= 6
            wall.initialize()
        elsif x > 6 and x <= 8
            skullWall.initialize()
        elsif x > 8
            brokenWall.initialize()
        end
    end
    
    def describe()
       print(@description)
    end
    
    class NormalWall()
        def initialize()
            @name = "Wall"
            @description = "A normal wall."
            print("Init Wall\n")
        end
    end
    
    class SkullWall()
        def initialize()
            @name = "Skull Wall"
            @description = "A wall full of skull, they may have some stuff left on them."
            print("Init Skull Wall\n")
        end
    end
    
    class BrokenWall()
        def initialize()
            @name = "Broken Wall"
            @description = "This wall seems craked, try to use your hammer to break it."
            print("Init Broken Wall\n")
        end
    end
end
