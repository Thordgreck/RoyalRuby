class WallFactory
    def WallFactory.new()
        x = rand(10) + 1
        if x <= 6 # 6/10
            NormalWall.new()
        elsif x <= 8 # 2/10
            SkullWall.new()
        elsif x <= 10 # 2/10
            BrokenWall.new()
        end
    end
end

class Wall
  @name
  @desc
  @helpDesc

  def initialize()
    @name = "Wall"
    @loot_probability = 0.0
  end

  def name()
    @name
  end

  def describe()
    @desc
  end

  def help()
    @helpDesc
  end

  def get_loot_probability()
    if @loot_probability.nil?
      @loot_probability = 0
    end
    @loot_probability
  end
end

class NormalWall < Wall
    def initialize()
        @name = "Wall"
        @desc = "A normal wall."
        @helpDesc = "You realy need help for this?"
    end
end

class SkullWall < Wall
    def initialize()
        @name = "Skull Wall"
        @desc = "A wall full of skulls, they may have some stuff left on them."
        @helpDesc = "Increase your loot chance in the room."
        @loot_probability = 2.0/7.0*100.0
    end
end

class BrokenWall < Wall
    def initialize()
        @name = "Broken Wall"
        @desc = "This wall seems craked, try to use your hammer to break it."
        @helpDesc = "Dwarf hammer! Nothing more to say!"
    end
end
