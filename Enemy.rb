class Enemy
    def initialize()
        print("Enemy Class\n")
    end
    
    def help()
        print(@helpDesc)
    end
    
    class NormalEnemy
        @name = "Enemy"
        @description = "A normal enemy."
        @helpDesc = "Nacked guy, 1Hp and remove 1Hp."
    end
    
    class Swordman
        # Sword
        @name = "Swordman"
        @description = "Soldier with a sword."
        @helpDesc = "Care his hit remove 2Hp!"
    end
    
    class ArmoredGuy
        # Armor
        @name = "Armored guy"
        @description = "He got an armor."
        @helpDesc = "He tank one of your hit."
    end
    
    class Knight
        # Armor + Sword
        @name = "Knight"
        @description = "The knight have a sword and an armor."
        @helpDesc = "He tank one of your hit and deals 2Hp damage."
    end
    
    class Magician
        # Use magic spell, ignore players armor
        @name = "Magician"
        @description = "Abracadabra!"
        @helpDesc = "Magic spell ignore armor!"
    end
end
