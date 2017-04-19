require_relative('Direction.rb')

def get_direction()
  puts("Where do you wan to go ?")
  a = ["n", "e", "s", "w"]
  direction = Direction.key(a.index(gets.chomp.downcase))
  while direction == nil
    puts "Not a good direction"
    direction = Direction.key(a.index(gets.chomp.downcase))
  end
  puts "You want to go to "+direction.to_s.downcase
  direction
end

def ask_param()
  print("The default size of the maze is 9x9, do you want to change it (y/N): ")
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
  if result
    ok = false
    while not ok
      print("Put the size of the maze in the format WxH (e.g 5x5): ")
      size = gets.chomp.downcase
      tab = size.split("x")
      if (tab == nil || tab.size != 2)
        print("Incorrect input, ")
        next
      end
      tab.map! { |e| e.to_i  }
      if (tab[0] <= 0 || tab[1] <= 0)
        print("Incorrect input, ")
        next
      end
      ok = true
    end
      tab
  else
    [9,9]
  end
end

def ask_new_game()
  print("\nReady for another game? (y/N): ")
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
