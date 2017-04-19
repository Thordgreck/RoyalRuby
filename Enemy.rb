class Enemy
    def initialize()
        print("Enemy Class\n")
    end
    
    def help()
        print(@helpDesc)
    end
    
    class NormalEnemy
        @name = "Enemy"
        @helpDesc = "Just a normal enemy"
    end
    
    class Swordman
        # Sword
        @name = "Swordman"
        @helpDesc = "Soldier with a sword, care his hit remove you 2Hp!"
    end
    
    class ArmoredGuy
        # Armor
        @name = "Armored guy"
        @helpDesc = "An armored guy, he tank one of your hit."
    end
    
    class Knight
        # Armor + Sword
        @name = "Knight"
        @helpDesc = "This knight have an armor and a sword, he tank one of your hit and deals 2Hp damage."
    end
    
    class Magician
        # Use magic spell, ignore players armor
        @name = "Magician"
        @helpDesc = "Magic spell ignore armor!"
    end
end
