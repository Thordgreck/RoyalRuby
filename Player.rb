class Player
    def initialize()
        @hp = 5
        @armor = FALSE
    end
  
    def takeDamage(dmg, ignorArmor)
        if ignorArmor == TRUE
           @hp -= dmg
           print("A fire ball hit you, you lose Hp.")
        elsif
            if @armor == TRUE
                @armor = FALSE
                print("Your armor break")
            else
                @hp -= dmg
                if @hp > 0
                    print("You lose " + dmg + "Hp.")
                else
                    print("You left your wife, your son, your home and this world for a better life...")
                    #Death END GAME
                end
            end
        end
    end
end
