require_relative 'Item.rb'

class Player

    attr_accessor :inventory
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

    def use_inventory()
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
      puts "Make your choice between Rock (r), Paper (p) or Scissors (s) :".magenta()
      gets.chomp
    end

    def chooseDirection(dir_list)
      puts("Where do you wan to go ?".magenta())
      a = ["n", "e", "s", "w"]
      direction = a.index(gets.chomp.downcase)
      while (direction == nil || !(dir_list.include? direction))
        puts "Not a good direction"
        direction = a.index(gets.chomp.downcase)
      end
      puts ("You want to go to "+Direction.key(direction).to_s.downcase).green()
      direction
    end

    def removeItem(index)
        @inventory.delete_at(index)
    end
    
    def equip()
        a = FASLE
        sp = FALSE
        s = FALSE
        ps = FALSE
        h = FALSE
        cmp = FALSE
        mp = FALSE
        p = FALSE
        myst = FALSE
        choice = "Possible choice :"
        
        if @armor == FALSE
            if @inventory.include? Armor
                print("You can equip an armor, do you want to equip it? (a / armor)").magenta()
                a = TRUE
                choice += " [a / armor]"
            end
        end
        
        if @armor == TRUE and @spike == FALSE
            if @inventory.include? Spike
                print("You have some spike, do you want to conbine them with your armor? (sp / spike)").magenta()
                sp = TRUE
                choice += " [sp / spike]"
            end
        end
        
        if @sword == 0
            if @inventory.include? Sword
                print("You have a sword in your magical bag. Do you want to take it? (s / sword)").magenta()
                s = TRUE
                choice += " [s / sword]"
            end
        end
        
        if @sword < 3
            if @inventory.include? Poison
                print("You have some poison, do you want to conbine it with your sword? (ps / poison)").magenta()
                ps = TRUE
                choice += " [ps / poison]"
            end
        end
        
        if @hammer == 0
            if @inventory.include? Hammer
                print("You have a hammer in your bag, do you want to take it? (h / hammer)").magenta()
                h = TRUE
                choice += " [h / hammer]"
            end
        end
        
        if @inventory.count(Potion) >= 5
            print("You have 5 potion in your bag, do you want to create a mega potion? (cmp / create)").magenta()
            cmp = TRUE
            choice += " [cmp / create]"
        end
        
        if @hp < @maxHp
            if @inventory.include? MegaPotion
                print("You have a mega potion, do you want to use it? (mp / mega)").magenta()
                mp = TRUE
                choice += " [mp / mega]"
            end
            
            if @inventory.include? Potion
                print("You have potion, do you want to use it? (p / potion)").magenta()
                p = TRUE
                choice += " [p / potion]"
            end
            
            if @inventory.include? MysteriousPotion
                print("YOu have a mysterious potion in your bag, it can be dangerous but do you want to use it? (myst / mysterious)").magenta()
                myst = TRUE
                choice += " [myst / mysterious]"
            end
        end
        
        print(choice + "\n")
        result = nil
        while result == nil
            r = gets.chomp.downcase
            if (a == TRUE and r == "a" || a == TRUE and r == "armor")
                @inventory.delete_at(@inventory.index(Armor))
                @armor = TRUE
                print("Armor on!")
            elsif (a == TRUE and r == "sp" || a == TRUE and r == "spike")
                @inventory.delete_at(@inventory.index(Spike))
                @spike = TRUE
                print("Spiked armor ready!")
            elsif (sp == TRUE and r == "s" || sp == TRUE and r == "sword")
                @inventory.delete_at(@inventory.index(Sword))
                @sword = 2
            elsif (ps == TRUE and r == "ps" || ps == TRUE and r == "poison")
                @inventory.delete_at(@inventory.index(Poison))
                @sword = 3
            elsif (h == TRUE and r == "h" || h == TRUE and r == "hammer")
                @inventory.delete_at(@inventory.index(Hammer))
                @hammer = 1
            elsif (cmp == TRUE and r == "cmp" || cmp == TRUE and r == "create")
                x = 0
                while x < 5
                    @inventory.delete_at(@inventory.index(Potion))
                    x += 1
                end
                @inventory.push(MegaPotion)
            elsif (mp == TRUE and r == "mp" || mp == TRUE and r == "mega")
                @inventory.delete_at(@inventory.index(MegaPotion))
                MegaPotion.drink()
            elsif (p == TRUE and r == "p" || p == TRUE and r == "potion")
                @inventory.delete_at(@inventory.index(Potion))
                Potion.drink()
            elsif (myst == TRUE and r == "myst" || myst == TRUE and r == "mysterious")
                @inventory.delete_at(@inventory.index(MysteriousPotion))
                MysteriousPotion.drink()
            elsif (r == "close")
                # CLOSE YOUR BAG
            end
            if (result == nil)
                print("Incorrect input\n")
            end
        end
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
