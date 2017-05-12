require_relative('Direction.rb')

def ask_param()
  print("Do you want to play the game or let an IA play it for you (me/IA): ")
  result = nil
  while result == nil
    r = gets.chomp.downcase
    if (r == "ia" || r == "i")
      result = false
    elsif (r == "me" || r == "m" || r == "")
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
