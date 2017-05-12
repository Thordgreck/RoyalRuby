#!/usr/bin/env ruby

require_relative 'IA.rb'
require_relative 'Game.rb'
require_relative 'Exception.rb'

again = TRUE
print("A long time ago in a galaxy far, far away, Sandra, a great adventurer
that loves to explore pyramids and other old places to find shiny treasures and
a lot of gold, is called in front of his king. The Royal Ruby that has been
stolen by a dragon, and Sandra has been chosen to be the one to retrieve it!
You will impersonate her, but be aware that there are monsters that want to
kill you and eat you. You will also find objects that will help you fight
monsters, survive, find the treasure and leave the maze.\n".bold_blue())
won = 0
lost = 0
while again
  begin
    Game.reset()
    Game.mainloop(Player.new())
  rescue WonGame => e
    puts "You win !!!!!!!!!!!!!".bold_cyan()
    won += 1
  rescue LooseGame => e
    puts "You left your wife, your son, your home and this world for a better life...".bold_red()
    lost += 1
  rescue StandardError => e
    puts won, lost
    raise e
  end
  again = FALSE
  if (lost + won < 1000)
    again = TRUE
  end
end
puts won, lost
