require_relative('Direction.rb')

def get_direction()
  puts("Where do you wan to go ?")
  direction = Direction.key(gets.chomp.downcase)
  if direction != nil
    puts "you want to go to "+direction.to_s.downcase
  else
    puts "not a good direction"
  end
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
