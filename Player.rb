class Player
    def initialize()
        @hp = 10
        @maxHp = 10
        @armor = FALSE
        @spike = FALSE
        @sword = 0 # MAX = 2 / If poison MAX = 3
        @hammer = 0 # 1 MAX A VOIR SI REPARATION ITEM
        @key = 0
        @dead = FALSE
        @won = FALSE
        @inventory = []
    end

    def isDead()
      @dead
    end

    def hasWon()
      @won
    end

    def add_item(proba) #probability in float % (0 - 100)
      r = Float(rand(100)) + 1.0
      if (r <= proba)
        item = ItemFactory.new()
        print("You found #{item.discovery}\n")
        @inventory << item
      end
    end

    def inventory()
      if !@inventory.empty?
        puts("In your inventory, you have the following items:")
        @inventory.each_with_index { |item, i|
          puts("[#{i}]: #{item.discovery} (#{item.describe})")
        }
      else
        puts("Your inventory is empty.")
      end
    end

    def takeDamage(dmg, ignorArmor)
        gameEnd = FALSE
        if ignorArmor == TRUE
           @hp -= dmg
           if @hp > 0
               print("A fire ball hit you, you lose Hp.\n")
           else
                print("You left your wife, your son, your home and this world for a better life...\n")
                @dead = TRUE
                gameEnd = TRUE
           end
        else
            if @armor == TRUE
                if @spike == TRUE
                    @spike = FALSE
                else
                    @armor = FALSE
                    print("Your armor break.\n")
                end
            else
                @hp -= dmg
                if @hp > 0
                    print("-#{dmg}Hp.\n")
                else
                    print("You left your wife, your son, your home and this world for a better life...\n")
                    @dead = TRUE
                    gameEnd = TRUE
                end
            end
        end
        if gameEnd == FALSE and @hp < @maxHp
            print("#{@hp}/#{@maxHp}Hp left!\n")
        end
        return(gameEnd)
    end

    def useHammer()
        if @hammer > 0
            @hammer -= 1
            TRUE
        else
            FALSE
        end
    end

    def swordUsage()
        @sword
    end

    def useSword()
        @sword -= 1
    end

    def haveSpike()
        @spike
    end

    def haveKey()
        @key
    end

    def useKey()
        @key -= 1
    end

    def getMaxHp()
        @maxHp
    end

    def heal(hp)
        @hp += hp
        if @hp > @maxHp
            @hp = @maxHp
        end
    end
end
