require_relative('Direction.rb')

puts("where do you wan to go ?")
direction = Direction.key(gets.chomp)
if direction != nil
  puts "you want to go to "+direction.to_s.downcase
else
  puts "not a good direction"
end
