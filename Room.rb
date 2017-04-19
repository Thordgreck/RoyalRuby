require_relative 'Door.rb'
require_relative 'Wall.rb'

class Room
  def initialize()
    self.walls = Array.new(4) {Wall.new()}
    self.doors = Array.new(4) {Door.new()}
  end

  def describe()
    self.walls.each { |a| a.describe()}
    self.doors.each { |a| a.describe()}
  end
end
