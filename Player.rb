class Player
    def initialize()
        @hp = 1
        @armor = FALSE
        @sword = 2
        @hammer = FALSE
        @key = 0
    end
  
    def takeDamage(dmg, ignorArmor)
        gameEnd = FALSE
        if ignorArmor == TRUE
           @hp -= dmg
           print("A fire ball hit you, you lose Hp.\n")
        elsif
            if @armor == TRUE
                @armor = FALSE
                print("Your armor break\n")
            else
                @hp -= dmg
                if @hp > 0
                    print("You lose #{dmg}Hp.\n")
                else
                    print("You left your wife, your son, your home and this world for a better life...\n")
                    gameEnd = TRUE
                end
            end
        end
        if gameEnd == FALSE
            print("#{@hp}Hp left!\n")
        end
        return(gameEnd)
    end
end
