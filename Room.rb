require_relative 'Door.rb'
require_relative 'Wall.rb'

class Room
  def initialize(needed_doors)
    @walls = Array.new(4) {Wall.new()}
    @doors = Array.new(4)
    @searched = FALSE
  end

  def describe()
    @walls.each { |a| a.describe()}
    @doors.each { |a| if (!a.nil?)
      a.describe()
    end}
  end
end
