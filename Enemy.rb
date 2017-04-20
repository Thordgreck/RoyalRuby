class EnemyFactory
    def EnemyFactory.new()
        x = rand(10) + 1
        if x <= 5
            NormalEnemy.new()
        elsif x > 5 and x <= 6
            Swordman.new()
        elsif x > 6 and x <= 8
            ArmoredGuy.new()
        elsif x == 9
            Knight.new()
        elsif x == 10
            Magician.new()
        end
    end
end

class Enemy
    @name
    @desc
    @helpDesc
    
    def name()
        @name
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

class NoEnemy < Enemy
    def initialize()
        @name = ""
        @desc = "The room is empty, maybe you can find some items on the ground."
        @helpDesc = ""
    end
    
    def fight(player)
    
    end
end

class NormalEnemy < Enemy
    def initialize()
        @name = "Enemy"
        @desc = "A normal enemy."
        @helpDesc = "Nacked guy, 1Hp and remove 1Hp."
    end
    
    def fight(player)
        mobHp = 1
        game = Rps.new()
        gameEnd = FALSE
        
        while mobHp > 0 and gameEnd == FALSE
            result = game.play()
            if result == 1
                mobHp -= 1
                print("You jump to dodge monster's attack and kill him.\n")
            elsif result == 0
                gameEnd = player.takeDamage(1, FALSE)
                if gameEnd == FALSE
                    mobHp -= 1
                    print("Your leg hurt a bit, but the monster is dead. Maybe it's time to find a potion or something...\n")
                end
            else
                gameEnd = player.takeDamage(1, FALSE)
                if gameEnd == FALSE
                    print("You miss, but the monster doesn't. Care!\n")
                end
            end
        end
    end
end

class Swordman < Enemy
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
        gameEnd = FALSE
        
        while mobHp > 0 and gameEnd == FALSE
            result = game.play()
            if result == 1
                mobHp -= 1
                print("You jump to dodge monster's attack and kill him.\n")
                elsif result == 0
                gameEnd = player.takeDamage(2, FALSE)
                if gameEnd == FALSE
                    mobHp -= 1
                    print("You kill the monster\n")
                end
                else
                gameEnd = player.takeDamage(2, FALSE)
                if gameEnd == FALSE
                    print("You miss, but the monster doesn't. Care!\n")
                end
            end
        end
    end
end

class ArmoredGuy < Enemy
    def initialize()
        @name = "Armored guy"
        @desc = "He got an armor."
        @helpDesc = "He tank one of your hit."
    end
    
    def fight(player)
        mobHp = 2
        game = Rps.new()
        gameEnd = FALSE
        
        while mobHp > 0 and gameEnd == FALSE
            result = game.play()
            if result == 1
                mobHp -= 1
                if mobHp == 0
                    print("You jump to dodge monster's attack and kill him.\n")
                    else
                    print("You hit the monster but only broke his armor, keep fighting!\n")
                end
                elsif result == 0
                gameEnd = player.takeDamage(1, FALSE)
                if gameEnd == FALSE
                    mobHp -= 1
                    if mobHp == 0
                        print("You need to find some Magician drinks. The monster is dead\n")
                        else
                        print("You hit the monster but only broke his armor, keep fighting!\n")
                    end
                end
                else
                gameEnd = player.takeDamage(1, FALSE)
                if gameEnd == FALSE
                    print("You miss, but the monster doesn't. Care!\n")
                end
            end
        end
    end
end

class Knight < Enemy
    def initialize()
        @name = "Knight"
        @desc = "Look at his horse! His horse is a-maz-ing!"
        @helpDesc = "He tank one of your hit and deals 2Hp damage (Armor + sword)."
    end
    
    def fight(player)
        mobHp = 2
        game = Rps.new()
        gameEnd = FALSE
        
        while mobHp > 0 and gameEnd == FALSE
            result = game.play()
            if result == 1
                mobHp -= 1
                if mobHp == 0
                    print("You jump to dodge monster's attack and kill him.\n")
                    else
                    print("You broke the armor of the Knight, keep fighting!\n")
                end
                elsif result == 0
                gameEnd = player.takeDamage(2, FALSE)
                if gameEnd == FALSE
                    mobHp -= 1
                    if mobHp == 0
                        print("You start to cry : \"MEDIC!!!! Oh no, wrong game... Damn knight...\"\n\n")
                        else
                        print("You broke the armor of the Knight, keep fighting!\n")
                    end
                end
                else
                gameEnd = player.takeDamage(2, FALSE)
                if gameEnd == FALSE
                    print("You miss, but the monster doesn't. Care!\n")
                end
            end
        end
    end
end

class Magician < Enemy
    def initialize()
        @name = "Magician"
        @desc = "Abracadabra!"
        @helpDesc = "Magic spell ignore armor!"
    end
    
    def fight(player)
        mobHp = 1
        game = Rps.new()
        gameEnd = FALSE
        
        while mobHp > 0 and gameEnd == FALSE
            result = game.play()
            if result == 1
                mobHp -= 1
                print("You dodge the first fire ball, jump over the second one and cut the wizard's head. You found his hat really nice, but you have more important stuffs to carry...\n")
                elsif result == 0
                gameEnd = player.takeDamage(1, TRUE)
                if gameEnd == FALSE
                    mobHp -= 1
                    print("You kill the magician but burning. You just start to hit you to remove the flame.\n")
                end
                else
                gameEnd = player.takeDamage(1, TRUE)
                if gameEnd == FALSE
                    print("You miss, but the fire ball doesn't. You're on fire! Care!\n")
                end
            end
        end
    end
end
