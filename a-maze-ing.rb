#!/usr/bin/env ruby

require_relative 'Player.rb'
require_relative 'Game.rb'
require_relative 'Exception.rb'

again = TRUE
print("---> INTRO TEXT\n")
while again
  begin
    Game.reset()
    Game.mainloop(Player.new())
  rescue WonGame => e
    puts "You win !!!!!!!!!!!!!".bold_cyan()
  rescue LooseGame => e
    puts "You left your wife, your son, your home and this world for a better life...".bold_red()
  rescue StandardError => e
    raise e
  end
  again = ask_new_game()
end
