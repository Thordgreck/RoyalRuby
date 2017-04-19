class Item
    def initialize()
        print("Item Class\n")
    end
    
    def help()
        print(@helpDesc)
    end
    
    class Armor
        @helpDesc = "This light armor prevent you to lose 1Hp when a monster hit you. Care magician enemies ignore your armor!"
    end
    
    class Sword
        @helpDesc = "The sword make you automatically win a fight (Only 2 use per sword, you can choose to use it or not)."
    end
    
    class Hammer
        @helpDesc = "A dwarf hammer, what better than that to break a wall?"
    end
    
    class Compass
        @helpDesc = "Show you the direction of the treasure room when you take it."
    end
    
    class Key
        @helpDesc = "If you find a door with a locket, you know what to do."
    end
    
    class Potion
        @helpDesc = "+1Hp, haha cool na ?"
    end
end
