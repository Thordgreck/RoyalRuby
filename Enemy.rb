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
    
    def fight(player)
        @enemy.fight(player)
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
        
        def fight(player)
            
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
        
        def fight(player)
            mobHp = 1
            game = Rps.new()
            
            while mobHp > 0
                result = game.play()
                if result == 1
                    mobHp -= 1
                    print("You jump on the monster and kill him.")
                elsif result == 0
                    player.takeDamage(1, FALSE)
                    mobHp -= 1
                    print("The monster is dead")
                else
                    player.takeDamage(1, FALSE)
                    print("You miss but the monster don't. Care!")
                end
            end
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
        
        def fight(player)
            mobHp = 1
            game = Rps.new()
            
            while mobHp > 0
                result = game.play()
                if result == 1
                    mobHp -= 1
                    print("You jump on the monster and kill him.")
                elsif result == 0
                    player.takeDamage(2, FALSE)
                    mobHp -= 1
                    print("You kill the monster")
                else
                    player.takeDamage(2, FALSE)
                    print("You miss but the monster don't. Care!")
                end
            end
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
        
        def fight(player)
            mobHp = 2
            game = Rps.new()
            
            while mobHp > 0
                result = game.play()
                if result == 1
                    mobHp -= 1
                    if mobHp == 0
                        print("You jump on the monster and kill him.")
                    else
                        print("You broke the armor of this Armored Guy, keep fighting!")
                    end
                elsif result == 0
                    player.takeDamage(1, FALSE)
                    mobHp -= 1
                    if mobHp == 0
                        print("You kill the monster")
                    else
                        print("You remove his armor, keep fighting!")
                    end
                else
                    player.takeDamage(1, FALSE)
                    print("You miss but the monster don't. Care!")
                end
            end
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
        
        def fight(player)
            mobHp = 2
            game = Rps.new()
            
            while mobHp > 0
                result = game.play()
                if result == 1
                    mobHp -= 1
                    if mobHp == 0
                        print("You jump on the monster and kill him.")
                    else
                        print("You broke the armor of the Knight, keep fighting!")
                    end
                elsif result == 0
                    player.takeDamage(2, FALSE)
                    mobHp -= 1
                    if mobHp == 0
                        print("You kill the monster")
                    else
                        print("You remove his armor, keep fighting!")
                    end
                else
                    player.takeDamage(2, FALSE)
                    print("You miss but the monster don't. Care!")
                end
            end
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
        
        def fight(player)
            mobHp = 1
            game = Rps.new()
            
            while mobHp > 0
                result = game.play()
                if result == 1
                    mobHp -= 1
                    print("You jump on the wizzard and kill him.")
                elsif result == 0
                    player.takeDamage(1, TRUE)
                    mobHp -= 1
                    print("You kill the magician")
                else
                    player.takeDamage(1, TRUE)
                    print("You miss but the fire ball don't. Care!")
                end
            end
        end
    end
end
