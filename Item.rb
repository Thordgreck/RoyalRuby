class Item
    def initialize()
        print("Item Class\n")
    end
    
    def describe()
        print(@desc)
    end
    
    def help()
        print(@helpDesc)
    end
    
    class NoItem
        @name = ""
        @desc = "There is nothing here!"
        @helpDesc = ""
    end
    
    class Armor
        @name = "Armor"
        @desc = "Shiny armor, you look like a vampire from a bad film."
        @helpDesc = "This light armor prevent you to lose Hp when a monster hit you. Care magician enemies ignore your armor! Light armor but you are too weak to take two of them (Only 1 use per armor)."
    end
    
    class Sword
        @name = "Sword"
        @desc = "Look like a paper knife but the size doesn't matter."
        @helpDesc = "The sword make you automatically win a fight. Don't go insane if you find two sword, you can only cary one of them (Only 2 use per sword, you can choose to use it or not)."
    end
    
    class Hammer
        @name = "Hammer"
        @desc = "Hammer! Dwarf hammer!"
        @helpDesc = "A dwarf hammer, what better than that to break a wall? A guy want to build a wall once, he receive some dwarf's hammer on the head (And some dwarf too)."
    end
    
    class Compass
        @name = "Compass"
        @desc = "A beautiful old compass slot in the rock, you can pick it but he show you a direction."
        @helpDesc = "Show you the direction of the treasure room when you take it."
    end
    
    class Key
        @name = "Key"
        @desc = ""
        @helpDesc = "If you find a door with a locket, you know what to do."
    end
    
    class Potion
        @name = "Potion"
        @desc = ""
        @helpDesc = "+1Hp, haha cool na?"
    end
end
