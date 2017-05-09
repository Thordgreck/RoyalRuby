class ItemFactory
    def ItemFactory.new()
        x = rand(20) + 1
        if x <= 3 # 3/20
            Armor.new()
        elsif x <= 6 # 3/20
            Sword.new()
        elsif x <= 9 # 3/20
            Hammer.new()
        elsif x == 10 # 1/20
            Compass.new()
        elsif x <= 12 # 2/20
            Key.new()
        elsif x <= 15 # 3/20
            Potion.new()
        elsif x <= 17 # 2/20
            Poison.new()
        elsif x <= 19 # 2/20
            MysteriousPot.new()
        elsif x == 20 # 1/20
            Spike.new()
        end
    end
end

class Item
    @name
    @desc
    @helpDesc

    def name()
        @name
    end

    def describe()
        @desc
    end

    def help()
        @helpDesc
    end

    def drink(player)

    end

    def discovery()
      @discovery.yellow()
    end
end

class NoItem < Item
    def initialize()
        @name = ""
        @desc = "There is nothing here!"
        @helpDesc = ""
    end
end

class Armor < Item
    def initialize()
        @name = "Armor"
        @desc = "Shiny armor, you look like a vampire from a bad film."
        @helpDesc = "This light armor prevent you to lose Hp when a monster hit you. Care magician enemies ignore your armor! Light armor but you are too weak to take two of them but you have the Jean-Claude Van Damme's magic bag with you where you can stock any items you want (Only 1 use per armor)."
        @discovery = "an "+@name
    end
end

class Sword < Item
    def initialize()
        @name = "Sword"
        @desc = "Look like a paper knife, but size doesn't matter."
        @helpDesc = "The sword makes you automatically win a fight. Don't go insane if you find two swords, you can only carry one of them, the second one goes in your magical bag (Only 2 use per sword, you can choose to use it or not)."
        @discovery = "a "+@name
    end
end

class Hammer < Item
    def initialize()
        @name = "Hammer"
        @desc = "Hammer! Dwarf hammer!"
        @helpDesc = "A dwarf hammer, what better than that to break a wall? A guy wants to build a wall once. He receives some dwarf's hammer on the head (And some dwarf too)."
        @discovery = "a "+@name
    end
end

class Compass < Item
    def initialize()
        @name = "Compass"
        @desc = "A beautiful old compass slot in the rock, you can't pick it but it shows you a direction."
        @helpDesc = "Show you the direction of the treasure room."
        @discovery = "a "+@name
    end
end

class Key < Item
    def initialize()
        @name = "Key"
        @desc = "Golden key! Wow! Awesome!"
        @helpDesc = "If you find a door with a locket, you know what to do."
        @discovery = "a "+@name
    end
end

class Potion < Item
    def initialize()
        @name = "Potion"
        @desc = "Wizards create weird things to drink."
        @helpDesc = "+1Hp, haha cool right? You can combine 5 potions to create a MegaPotion that fully heal you."
        @discovery = "a "+@name
    end

    def drink(player)
        player.heal(1)
    end
end

class Poison < Item
    def initialize()
        @name = "Poison"
        @desc = "Neither Magicians and monsters like it"
        @helpDesc = "-1Hp, saaaad :'( Can be use to improve sword efficiency (Sword = 3 use)."
        @discovery = "a "+@name
    end

    def drink(player)
        player.heal(-1)
    end
end

class MysteriousPot < Item
    def initialize()
        @name = "Mysterious potion"
        @desc = "Can heal you or kill you, pray god more often!"
        @helpDesc = "Health 2Hp or remove 1."
        @discovery = "a "+@name
    end

    def drink(player)
        x = rand(2)
        if x == 0
            player.heal(2)
        else
            player.heal(-1)
        end
    end
end

class MegaPotion < Item
    def initialize()
        @name = "Mega potion"
        @desc = "You try to mix potion like your magician's friend do and you succeed good job!"
        @helpDesc = "Full Hp, nice potion!"
        @discovery = "a "+@name
    end

    def drink(player)
        player.heal(player.getMaxHp())
    end
end

class Spike < Item
    def initialize()
        @name = "Spike"
        @desc = "If it was on your armor it can give you a lot of style."
        @helpDesc = "Try to use them on your armor, deal damage to enemies when they hit you. Care they can break."
        @discovery = "a "+@name
    end
end
