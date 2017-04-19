class Item
    def initialize()
        @name = "Default Item"
        @desc = "Default Item"
        @helpDesc = "Default Item"
        
        x = rand(10) + 1
        if x <= 2
            @item = Armor.new()
        elsif x > 2 and x <= 4
            @item = Sword.new()
        elsif x > 4 and x <= 7
            @item = Hammer.new()
        elsif x == 8
            @item = Compass.new()
        elsif x == 9
            @item = Key.new()
        elsif x == 10
            @item = Potion.new()
        end
        
        @item
    end
    
    def describe()
        @item.describe()
    end
    
    def help()
        @item.help()
    end
    
    class NoItem
        def initialize()
            @name = ""
            @desc = "There is nothing here!"
            @helpDesc = ""
        end
        
        def describe()
            print(@desc + "\n")
        end
        
        def help()
            print(@helpDesc + "\n")
        end
    end
    
    class Armor
        def initialize()
            @name = "Armor"
            @desc = "Shiny armor, you look like a vampire from a bad film."
            @helpDesc = "This light armor prevent you to lose Hp when a monster hit you. Care magician enemies ignore your armor! Light armor but you are too weak to take two of them (Only 1 use per armor)."
        end
        
        def describe()
            print(@desc + "\n")
        end
        
        def help()
            print(@helpDesc + "\n")
        end
    end
    
    class Sword
        def initialize()
            @name = "Sword"
            @desc = "Look like a paper knife but the size doesn't matter."
            @helpDesc = "The sword make you automatically win a fight. Don't go insane if you find two sword, you can only cary one of them (Only 2 use per sword, you can choose to use it or not)."
        end
        
        def describe()
            print(@desc + "\n")
        end
        
        def help()
            print(@helpDesc + "\n")
        end
    end
    
    class Hammer
        def initialize()
            @name = "Hammer"
            @desc = "Hammer! Dwarf hammer!"
            @helpDesc = "A dwarf hammer, what better than that to break a wall? A guy want to build a wall once, he receive some dwarf's hammer on the head (And some dwarf too)."
        end
        
        def describe()
            print(@desc + "\n")
        end
        
        def help()
            print(@helpDesc + "\n")
        end
    end
    
    class Compass
        def initialize()
            @name = "Compass"
            @desc = "A beautiful old compass slot in the rock, you can't pick it but it shows you a direction."
            @helpDesc = "Show you the direction of the treasure room when you take it."
        end
        
        def describe()
            print(@desc + "\n")
        end
        
        def help()
            print(@helpDesc + "\n")
        end
    end
    
    class Key
        def initialize()
            @name = "Key"
            @desc = "Golden key! Wow! Awesome!"
            @helpDesc = "If you find a door with a locket, you know what to do."
        end
        
        def describe()
            print(@desc + "\n")
        end
        
        def help()
            print(@helpDesc + "\n")
        end
    end
    
    class Potion
        def initialize()
            @name = "Potion"
            @desc = "Wizzard create weird thing to drink."
            @helpDesc = "+1Hp, haha cool na?"
        end
        
        def describe()
            print(@desc + "\n")
        end
        
        def help()
            print(@helpDesc + "\n")
        end
    end
end
