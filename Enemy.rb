class Enemy
    def initialize()
        print("Enemy Class\n")
    end
    
    def help()
        print(@helpDesc)
    end
    
    class NormalEnemy
        @helpDesc = "Just a normal enemy"
    end
    
    class SwordMan
        # Sword
        @helpDesc = "Soldier with a sword, care his hit remove you 2Hp!"
    end
    
    class Armored
        # Armor
        @helpDesc = "An armored guy, he tank one of your hit."
    end
    
    class Knight
        # Armor + Sword
        @helpDesc = "This knight have an armor and a sword, he tank one of your hit and deals 2Hp damage."
    end
    
    class Magician
        # Use magic spell, ignore players armor
        @helpDesc = "Magic spell ignore armor!"
    end
end
