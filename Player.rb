require_relative 'Item.rb'
require_relative 'Game.rb'

class Array
  def includesType?(type)
    self.each { |elem|
      if elem.class == type
        return TRUE
      end
    }
    FALSE
  end

  def countType(type)
    i = 0
    self.each { |elem|
      if elem.class == type
        i += 1
      end
    }
    i
  end

  def indexOfType(type)
    self.each_with_index { |elem, i|
      if elem.class == type
        return i
      end
    }
    nil
  end
end

class Player

    attr_accessor :inventory
    def initialize()


        @hp = 30
        @maxHp = 30
        @armor = FALSE
        @spike = FALSE
        @sword = 0 # MAX = 2 / If poison MAX = 3
        @hammer = 0 # 1 MAX A VOIR SI REPARATION ITEM
        @key = 0
        @dead = FALSE
        @won = FALSE
        @inventory = []
    end

    def dragonAttack()
      @hp = 1
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
        if item.class == Compass
          print("the compass is used, now you have more chance to discover the treasure room or the exit room\n")
          RoomFactory.increase_probability_special_room()
        else
          @inventory << item
        end
      end
    end

    def use_inventory()
      puts "Do you want to see your inventory (y/N)?".magenta()
      if (result = ask_yes_not())
          puts
          if !@inventory.empty?
            puts("In your inventory, you have the following items:".yellow())
            @inventory.each_with_index { |item, i|
              puts("[#{i}]: #{item.discovery} (#{item.describe})")
            }

            print("Do you want to use some items ? (y/N)\n".magenta())
            result = ask_yes_not
            if result == TRUE
                equip()
            end

          else
            puts("Your inventory is empty.".yellow())
          end
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
                  raise LooseGame.new()
                    print("You left your wife, your son, your home and this world for a better life...\n")
                    @dead = TRUE
                    gameEnd = TRUE
                end
            end
        end
        if gameEnd == FALSE && @hp < @maxHp
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

    def getHp()
        @hp
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
      possibilities = ["r", "p", "s"]
      input = gets.chomp.downcase
      if (input == "")
        return possibilities[rand(possibilities.size)]
      end
      input
    end

    def chooseDirection(dir_list)
      list_avail = ""
      dir_list.each { |dir|
        list_avail += " " + String(Direction.key(dir))
      }
      puts "Where do you wan to go ? ".magenta() + list_avail.blue()
      a = ["n", "e", "s", "w"]
      input = gets.chomp.downcase
      if (input == "")
        direction = dir_list[rand(dir_list.size)]
      else
        direction = a.index(input)
      end
      while (direction == nil || !(dir_list.include? direction))
        puts "Not a good direction"
        input = gets.chomp.downcase
        direction = a.index(input)
      end
      puts ("You want to go toward the " + Direction.key(direction).to_s.downcase).green()
      direction
    end

    def removeItem(index)
        @inventory.delete_at(index)
    end

    def equip()
        a = FALSE
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
            if @inventory.includesType? Armor
                puts("You can equip an armor, do you want to equip it? (a / armor)".magenta())
                a = TRUE
                choice += " [a / armor]"
            end
        end

        if @armor == TRUE && @spike == FALSE
            if @inventory.includesType? Spike
                puts("You have some spike, do you want to conbine them with your armor? (sp / spike)".magenta())
                sp = TRUE
                choice += " [sp / spike]"
            end
        end

        if @sword == 0
            if @inventory.includesType? Sword
                puts("You have a sword in your magical bag. Do you want to take it? (s / sword)".magenta())
                s = TRUE
                choice += " [s / sword]"
            end
        end

        if @sword < 3
            if @inventory.includesType? Poison
                puts("You have some poison, do you want to conbine it with your sword? (ps / poison)".magenta())
                ps = TRUE
                choice += " [ps / poison]"
            end
        end

        if @hammer == 0
            if @inventory.includesType? Hammer
                puts("You have a hammer in your bag, do you want to take it? (h / hammer)".magenta())
                h = TRUE
                choice += " [h / hammer]"
            end
        end

        if @inventory.countType(Potion) >= 5
            puts("You have 5 potion in your bag, do you want to create a mega potion? (cmp / create)".magenta())
            cmp = TRUE
            choice += " [cmp / create]"
        end

        if @hp < @maxHp
            if @inventory.includesType? MegaPotion
                puts("You have a mega potion, do you want to use it? (mp / mega)".magenta())
                mp = TRUE
                choice += " [mp / mega]"
            end

            if @inventory.includesType? Potion
                puts("You have potion, do you want to use it? (p / potion)".magenta())
                p = TRUE
                choice += " [p / potion]"
            end

            if @inventory.includesType? MysteriousPot
                puts("You have a mysterious potion in your bag, it can be dangerous but do you want to use it? (myst / mysterious)".magenta())
                myst = TRUE
                choice += " [myst / mysterious]"
            end
        end

        if (a == FALSE && sp == FALSE && s == FALSE && ps == FALSE && h == FALSE && cmp == FALSE && mp == FALSE && p == FALSE && myst == FALSE)
            print("You can do nothing.\n")
        else
            print(choice + " [c / close]\n")
            result = nil
            while result == nil
                r = gets.chomp.downcase
                if (a == TRUE && r == "a" || a == TRUE && r == "armor")
                    result = TRUE
                    @inventory.delete_at(@inventory.indexOfType(Armor))
                    @armor = TRUE
                    print("Armor on!\n")
                elsif (sp == TRUE && r == "sp" || sp == TRUE && r == "spike")
                    result = TRUE
                    @inventory.delete_at(@inventory.indexOfType(Spike))
                    @spike = TRUE
                    print("Spiked armor ready!\n")
                elsif (s == TRUE && r == "s" || s == TRUE && r == "sword")
                    result = TRUE
                    @inventory.delete_at(@inventory.indexOfType(Sword))
                    @sword = 2
                    print("Sword equiped!\n")
                elsif (ps == TRUE && r == "ps" || ps == TRUE && r == "poison")
                    result = TRUE
                    @inventory.delete_at(@inventory.indexOfType(Poison))
                    @sword = 3
                    print("Poison applyed on your sword.\n")
                elsif (h == TRUE && r == "h" || h == TRUE && r == "hammer")
                    result = TRUE
                    @inventory.delete_at(@inventory.indexOfType(Hammer))
                    @hammer = 1
                    print("Hammer equiped.\n")
                elsif (cmp == TRUE && r == "cmp" || cmp == TRUE && r == "create")
                    result = TRUE
                    x = 0
                    while x < 5
                        @inventory.delete_at(@inventory.indexOfType(Potion))
                        x += 1
                    end
                    @inventory.push(MegaPotion.new())
                    print("Megapotion created.\n")
                elsif (mp == TRUE && r == "mp" || mp == TRUE && r == "mega")
                    result = TRUE
                    MegaPotion.drink(self)
                    @inventory.delete_at(@inventory.indexOfType(MegaPotion))
                elsif (p == TRUE && r == "p" || p == TRUE && r == "potion")
                    result = TRUE
                    Potion.drink(self)
                    @inventory.delete_at(@inventory.indexOfType(Potion))
                elsif (myst == TRUE && r == "myst" || myst == TRUE && r == "mysterious")
                    result = TRUE
                    MysteriousPot.drink(self)
                    @inventory.delete_at(@inventory.indexOfType(MysteriousPot))
                elsif (r == "c" || r == "close")
                    result = FALSE
                end
                if (result == nil)
                    print("Incorrect input\n")
                end
            end
            if result == TRUE
                equip()
            end
        end
    end
end

class IA < Player

  def initialize()
    @list_room_visited = []
    super()
  end
    # Each turn the IA check his inventory and use items
    def equip()
        if @armor == FALSE
            if @inventory.includesType? Armor
                @inventory.delete_at(@inventory.indexOfType(Armor))
                @armor = TRUE
            end
        end

        if @armor == TRUE && @spike == FALSE
            if @inventory.includesType? Spike
                @inventory.delete_at(@inventory.indexOfType(Spike))
                @spike = TRUE
            end
        end

        if @sword == 0
            if @inventory.includesType? Sword
                @inventory.delete_at(@inventory.indexOfType(Sword))
                @sword = 2
            end
        end

        if @sword == 1
            if @inventory.includesType? Poison
                @inventory.delete_at(@inventory.indexOfType(Poison))
                @sword = 3
            end
        end

        if @hammer == 0
            if @inventory.includesType? Hammer
                @inventory.delete_at(@inventory.indexOfType(Hammer))
                @hammer = 1
            end
        end

        if @inventory.countType(Potion) >= 5
            x = 0
            while x < 5
                @inventory.delete_at(@inventory.indexOfType(Potion))
                x += 1
            end
            @inventory.push(MegaPotion)
        end

        if @hp <= 5
            if @inventory.includesType? MegaPotion
                @inventory.delete_at(@inventory.indexOfType(MegaPotion))
                MegaPotion.drink(self)
            end
        end

        if @hp < 3
            if @inventory.includesType? Potion
                @inventory.delete_at(@inventory.indexOfType(Potion))
                Potion.drink(self)
            end
        end

        if @hp <= 5
            if @inventory.includesType? MysteriousPot
                @inventory.delete_at(@inventory.indexOfType(MysteriousPot))
                MysteriousPot.drink(self)
            end
        end
    end

    def chooseWeapon()
      puts "Make your choice between Rock (r), Paper (p) or Scissors (s) :".magenta()
      possibilities = ["r", "p", "s"]
      return possibilities[rand(possibilities.size)]
    end

    def use_inventory()
      if !@inventory.empty?
        equip()
      end
    end

    def chooseDirection(dir_list)
      list_avail = ""

      dir_list.each { |dir|
        list_avail += " " + String(Direction.key(dir))
      }
      puts "Where do you wan to go ? ".magenta() + list_avail.blue()
      a = ["n", "e", "s", "w"]
      direction = nil
      dir_list.each { |dir|
        rs = RoomFactory.getRoom(Game.getCurrent.x, Game.getCurrent().y, dir)
        if rs.nil?
          dir = rs
          break
        end
      }
      if direction.nil?
        dir_list.each { |dir|
          rs = RoomFactory.getRoom(Game.getCurrent().x, Game.getCurrent().y, dir)
          if !rs.nil?
            if rs = @list_room_visited[@list_room_visited.size() -1]
              direction = dir
              break
            end
          end
        }
      else
        @list_room_visited << Game.getCurrent()
      end
      if direction.nil?
        direction = dir_list[rand(dir_list.size)]
      end

      puts ("You want to go toward the " + Direction.key(direction).to_s.downcase).green()
      direction
    end
end
