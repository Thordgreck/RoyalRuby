class Enemy
    def initialize()
        @name = "Default Enemy"
        @desc = "Default Enemy"
        @helpDesc = "Default Enemy"
        
        x = rand(10) + 1
        if x <= 5
            @enemy = NormalEnemy.new()
        elsif x > 5 and x <= 6
            @enemy = Swordman.new()
        elsif x > 6 and x <= 8
            @enemy = ArmoredGuy.new()
        elsif x == 9
            @enemy = Knight.new()
        elsif x == 10
            @enemy = Magician.new()
        end
        
        @enemy
    end
    
    def describe()
        @enemy.describe()
    end
    
    def help()
        @enemy.help()
    end
    
    class NoEnemy
        def initialize()
            @name = ""
            @desc = "The room is empty, maybe you can find some items on the ground."
            @helpDesc = ""
        end
        
        def describe()
            print(@desc + "\n")
        end
        
        def help()
            print(@helpDesc + "\n")
        end
    end
    
    class NormalEnemy
        def initialize()
            @name = "Enemy"
            @desc = "A normal enemy."
            @helpDesc = "Nacked guy, 1Hp and remove 1Hp."
        end
        
        def describe()
            print(@desc + "\n")
        end
        
        def help()
            print(@helpDesc + "\n")
        end
    end
    
    class Swordman
        def initialize()
            @name = "Swordman"
            @desc = "Soldier with a sword."
            @helpDesc = "Care his hit remove 2Hp!"
        end
        
        def describe()
            print(@desc + "\n")
        end
        
        def help()
            print(@helpDesc + "\n")
        end
    end
    
    class ArmoredGuy
        def initialize()
            @name = "Armored guy"
            @desc = "He got an armor."
            @helpDesc = "He tank one of your hit."
        end
        
        def describe()
            print(@desc + "\n")
        end
        
        def help()
            print(@helpDesc + "\n")
        end
    end
    
    class Knight
        def initialize()
            @name = "Knight"
            @desc = "Look at his horse! His horse is a-maz-ing! (Armor and sword)"
            @helpDesc = "He tank one of your hit and deals 2Hp damage."
        end
        
        def describe()
            print(@desc + "\n")
        end
        
        def help()
            print(@helpDesc + "\n")
        end
    end
    
    class Magician
        def initialize()
            @name = "Magician"
            @desc = "Abracadabra!"
            @helpDesc = "Magic spell ignore armor!"
        end
        
        def describe()
            print(@desc + "\n")
        end
        
        def help()
            print(@helpDesc + "\n")
        end
    end
end
