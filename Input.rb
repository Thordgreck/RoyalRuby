require_relative('Direction.rb')

def get_direction()
  puts("Where do you wan to go ?".magenta())
  a = ["n", "e", "s", "w"]
  direction = a.index(gets.chomp.downcase)
  while direction == nil
    puts "Not a good direction"
    direction = a.index(gets.chomp.downcase)
  end
  puts ("You want to go to "+Direction.key(direction).to_s.downcase).green()
  direction
end

def ask_param()
  print("Do you want to play the game or let an IA play it for you (me/IA): ")
  result = nil
  while result == nil
    r = gets.chomp.downcase
    if (r == "ia" || r == "IA" || r == "")
      result = false
    elsif (r == "me" || r == "m")
      result = true
    end
    if (result == nil)
      print("Incorrect input, write me, m, ia or IA: ")
    end
  end
  result # If true -> Player / If false -> IA
end

def ask_yes_not()
  result = nil
  while result == nil
    r = gets.chomp.downcase
    if (r == "n" || r == "no" || r == "")
      result = false
    elsif (r == "y" || r == "yes")
      result = true
    end
    if (result == nil)
      print("Incorrect input, write yes, no, y or n: ")
    end
  end
  result
end

def ask_new_game()
  print("\nReady for another game? (y/N): ")
  ask_yes_not()
end
