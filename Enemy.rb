class Enemy
    def initialize()
        print("Enemy Class\n")
    end
    
    def describe()
        print(@description)
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
        @name = "Swordman"
        @description = "Soldier with a sword."
        @helpDesc = "Care his hit remove 2Hp!"
    end
    
    class ArmoredGuy
        @name = "Armored guy"
        @description = "He got an armor."
        @helpDesc = "He tank one of your hit."
    end
    
    class Knight
        @name = "Knight"
        @description = "Look at his horse! His horse is a-maz-ing! (Armor and sword)"
        @helpDesc = "He tank one of your hit and deals 2Hp damage."
    end
    
    class Magician
        @name = "Magician"
        @description = "Abracadabra!"
        @helpDesc = "Magic spell ignore armor!"
    end
end
