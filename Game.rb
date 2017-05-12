require_relative 'colorize.rb'
require_relative 'Room.rb'
require_relative 'Enemy.rb'
require_relative 'Input.rb'

class Game
    @@x = 0
    @@y = 0
    @@current = nil
    @@dragon = 0

    def Game.mainloop(player)
        while !player.isDead && !player.hasWon
            if (@@current.nil?)
                puts ("Created room at " + @@x.to_s + " " + @@y.to_s).white()
                @@current = RoomFactory.newRoom(@@x, @@y)
                if @@current.wakes_dragon()
                    @@dragon = 15
                end
            end
            puts ("Went in room " + @@x.to_s + " " + @@y.to_s).white()
            @@current.describe()
            if @@dragon == 16
                @@dragon -= 1
                puts "You woke the dragon!!!".red()
                player.takeDamage(1, TRUE)
                elsif @@dragon >= 6
                @@dragon -= 1
                puts "The dragon attacks you!!!".red()
                player.takeDamage(1, TRUE)
                if @@dragon == 0
                    @@dragon -= 1
                end
                elsif @@dragon >= 2
                @@dragon -= 1
                puts "The dragon went back to check on his treasure, but he might be back!!!".red()
                elsif @@dragon == 1
                @@dragon -= 1
                if rand(2) == 0
                    puts "The dragon went back to eat you!\nHe brought you back to the treasure room and reduced your Hp to 1!!".red()
                    player.dragonAttack()
                end
            end
            if player.isDead
                return
            end
            r = rand(3)
            fought_monster = FALSE
            if r == 2
                enemy = EnemyFactory.new()
                enemy.fight(player)
                fought_monster = TRUE
            end
            if player.isDead
                return
            end
            puts "You look around in the room, maybe you will find something?".yellow()
            @@current.loot(player, fought_monster)
            if(!player.inventory.empty?)
                puts "Do you want to see your inventory (y/N)?".magenta()
                if (result = ask_yes_not())
                    puts
                    player.use_inventory()
                end
            end
            puts
            can_move = FALSE
            direction = nil
            avail = @@current.availableDoors()
            while !can_move
                puts "Select a direction in the availables:".magenta()
                direction = player.chooseDirection(avail)
                if @@current.canMove(direction)
                    can_move = @@current.tryMove(direction, player)
                end
                avail.delete_at(avail.index(direction))
            end
            @@current = RoomFactory.getRoom(@@x, @@y, direction)
            if direction == Direction::NORTH
                @@y += 1
                elsif direction == Direction::SOUTH
                @@y -= 1
                elsif direction == Direction::EAST
                @@x += 1
                elsif direction == Direction::WEST
                @@x -= 1
            end
        end
    end

    def Game.getCurrent()
        @@current
    end

    def Game.setCurrent(x, y)
        @@current = @@current.getRoom(0,0)
    end
end
