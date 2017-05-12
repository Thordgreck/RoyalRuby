#!/usr/bin/env ruby

require_relative 'Room.rb'
require_relative 'Item.rb'
require_relative 'Door.rb'
require_relative 'Wall.rb'
require_relative 'Direction.rb'
require_relative 'Input.rb'
require_relative 'Player.rb'
require_relative 'Rps.rb'
require_relative 'Enemy.rb'
require_relative 'Game.rb'
require_relative 'colorize.rb'

again = TRUE
print("---> INTRO TEXT\n")
while again
  Game.mainloop(IA.new())
  again = ask_new_game()
end
