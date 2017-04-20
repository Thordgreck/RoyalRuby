class Direction
  def Direction.add_item(key,value)
    @hash ||= {}
    @hash[key]=value
  end

  def Direction.const_missing(key) #DO NOT CHANGE THIS NAME!!!
    @hash[key]
  end

  def Direction.each
    @hash.each {|key,value| yield(key,value)}
  end

  def Direction.key(value)
    @hash.key(value)
  end

  def Direction.value(key)
    @hash[key]
  end

  Direction.add_item :NORTH, 0
  Direction.add_item :EST, 1
  Direction.add_item :SOUTH, 2
  Direction.add_item :WEST, 3
end

#That's it! We can now use our enum :

#my_Direction = Direction::NORTH if some_condition

#And we can loop :

#Direction.each do |key,value|
#  do_something_with_value(value)
#end
