class Direction
    def Direction.add_item(key,value)
        @hash ||= {}
        @hash[key]=value
    end

    def Direction.const_missing(key)
        @hash[key]
    end

    def Direction.each
        @hash.each {|key,value| yield(key,value)}
    end

    def Direction.key(value)
      @hash.key(value)
    end
    
    Direction.add_item :NORTH, "n"
    Direction.add_item :EST, "e"
    Direction.add_item :SOUTH, "s"
    Direction.add_item :WEST, "w"
end

#That's it! We can now use our enum :

#my_Direction = Direction::NORTH if some_condition

#And we can loop :

#Direction.each do |key,value|
#  do_something_with_value(value)
#end
