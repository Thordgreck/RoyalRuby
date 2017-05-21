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
player = ask_param()
make_stats = TRUE
stat_round_nbr = 20
while again
  begin
    Game.reset()
    if (player)
      Game.mainloop(Player.new())
    else
      Game.mainloop(IA.new())
    end
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
  if (make_stats && lost + won < stat_round_nbr)
    again = TRUE
  elsif (!make_stats)
    puts "Do you want to play again? (y/N)".bold_magenta()
    again = ask_yes_not()
  end
end
puts "You won " + won.to_s() + " times, and lost " + lost.to_s() + " times."
puts "This makes a win ratio of " + (Float(won) / Float(stat_round_nbr)).to_s()
