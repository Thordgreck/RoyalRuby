class Enemy
    def initialize()
        @name = "Default Enemy"
        @desc = "Default Enemy"
        @helpDesc = "Default Enemy"
        print("Enemy Class\n")
    end
    
    def describe()
        print(@desc)
    end
    
    def help()
        print(@helpDesc)
    end
    
    class NoEnemy
       @name = ""
       @desc = "The room is empty, maybe you can find some items on the ground."
       @helpDesc = ""
    end
    
    class NormalEnemy
        @name = "Enemy"
        @desc = "A normal enemy."
        @helpDesc = "Nacked guy, 1Hp and remove 1Hp."
    end
    
    class Swordman
        @name = "Swordman"
        @desc = "Soldier with a sword."
        @helpDesc = "Care his hit remove 2Hp!"
    end
    
    class ArmoredGuy
        @name = "Armored guy"
        @desc = "He got an armor."
        @helpDesc = "He tank one of your hit."
    end
    
    class Knight
        @name = "Knight"
        @desc = "Look at his horse! His horse is a-maz-ing! (Armor and sword)"
        @helpDesc = "He tank one of your hit and deals 2Hp damage."
    end
    
    class Magician
        @name = "Magician"
        @desc = "Abracadabra!"
        @helpDesc = "Magic spell ignore armor!"
    end
end
