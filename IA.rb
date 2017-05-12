require_relative 'Player.rb'

class IA < Player

  def initialize()
    @list_room_visited = []
    @need_save_room = FALSE
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
        rs = RoomFactory.getRoom(Game.getCurrent().x, Game.getCurrent().y, dir)
        if rs.nil?
          direction = dir
          break
        end
      }
      if direction.nil?
        dir_list.each { |dir|
          rs = RoomFactory.getRoom(Game.getCurrent().x, Game.getCurrent().y, dir)
          if !rs.nil?
            if rs == @list_room_visited[@list_room_visited.size() -1]
              direction = dir
              break
            end
          end
          @need_save_room = FALSE
        }
      else
        @need_save_room = TRUE
      end


      puts ("You want to go toward the " + Direction.key(direction).to_s.downcase).green()
      direction
    end

    def validate_move()
      if (@need_save_room)
        @list_room_visited << Game.getCurrent()
      end
    end

end
