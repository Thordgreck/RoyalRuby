require_relative 'Item.rb'

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
        puts("In your inventory, you have the following items:".yellow())
        @inventory.each_with_index { |item, i|
          puts("[#{i}]: #{item.discovery} (#{item.describe})")
        }
      else
        puts("Your inventory is empty.".yellow())
      end
    end

    def takeDamage(dmg, ignorArmor)
        gameEnd = FALSE
        if ignorArmor == TRUE
           @hp -= dmg
           if @hp > 0
               print("A fire ball hit you, you lose Hp.\n".red())
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
                    print("Your armor break.\n".red())
                end
            else
                @hp -= dmg
                if @hp > 0
                    print("You lost #{dmg}Hp.\n".red())
                else
                    print("You left your wife, your son, your home and this world for a better life...\n")
                    @dead = TRUE
                    gameEnd = TRUE
                end
            end
        end
        if gameEnd == FALSE and @hp < @maxHp
            print("Hp remaining: #{@hp}/#{@maxHp}!\n".red())
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
    
    def chooseWeapon()
        
    end
    
    def chooseDirection()
        
    end
    
    def equip()
        
    end
end

class IA < Player
    
    # Each turn the IA check his inventory and use items
    def equip()
        if @armor == FALSE
            if @inventory.include? Armor
                @inventory.delete_at(@inventory.index(Armor))
                @armor = TRUE
            end
        end
        
        if @armor == TRUE and @spike == FALSE
            if @inventory.include? Spike
                @inventory.delete_at(@inventory.index(Spike))
                @spike = TRUE
            end
        end
        
        if @sword == 0
            if @inventory.include? Sword
                @inventory.delete_at(@inventory.index(Sword))
                @sword = 2
            end
        end
        
        if @sword == 1
            if @inventory.include? Poison
                @inventory.delete_at(@inventory.index(Poison))
                @sword = 3
            end
        end
        
        if @hammer == 0
            if @inventory.include? Hammer
                @inventory.delete_at(@inventory.index(Hammer))
                @hammer = 1
            end
        end
        
        if @inventory.count(Potion) >= 5
            x = 0
            while x < 5
                @inventory.delete_at(@inventory.index(Potion))
                x += 1
            end
            @inventory.push(MegaPotion)
        end
        
        if @hp <= 5
            if @inventory.include? MegaPotion
                @inventory.delete_at(@inventory.index(MegaPotion))
                MegaPotion.drink()
            end
        end
        
        if @hp < 3
            if @inventory.include? Potion
                @inventory.delete_at(@inventory.index(Potion))
                Potion.drink()
            end
        end
        
        if @hp <= 5
            if @inventory.include? MysteriousPotion
                @inventory.delete_at(@inventory.index(MysteriousPotion))
                MysteriousPotion.drink()
            end
        end
    end
    
end
