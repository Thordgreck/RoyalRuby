require_relative('Direction.rb')

def get_direction()
  puts("where do you wan to go ?")
  direction = Direction.key(gets.chomp.downcase)
  if direction != nil
    puts "you want to go to "+direction.to_s.downcase
  else
    puts "not a good direction"
  end
  direction
end

def ask_param()
  puts("The default size of the maze is 9x9, do you want to change it: y/n")
  result = nil
  while result == nil
    r = gets.chomp.downcase
    if (r == "n" || r == "no")
      result = false
    elsif (r == "y" || r == "yes")
      result = true
    end
    if (result == nil)
      puts("incorrect input write yes or no")
    end
  end
  if result
    puts("put the size of the maze in the format DxD, e.g 5x5")
    size = gets.chomp.downcase
    tab = size.split("x")
    if (tab == nil || tab.size != 2)
      puts("incorrect input, put the size of the maze in the format DxD, e.g 5x5")
    end
    tab.map! { |e| e.to_i  }
    tab
  else
    [9,9]
  end
end
