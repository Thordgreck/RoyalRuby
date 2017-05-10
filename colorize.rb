class String
    def colorize(color_code)
        "\e[#{color_code}m#{self}\e[0m"
    end

    def nigga
        colorize(30)
    end

    def red
        colorize(31)
    end

    def green
        colorize(32)
    end

    def yellow
        colorize(33)
    end

    def blue
        colorize(34)
    end

    def magenta
        colorize(35)
    end

    def cyan
        colorize(36)
    end

    def white
        colorize(37)
    end
    
    def bold_nigga
        colorize("1;30")
    end
    
    def bold_red
        colorize("1;31")
    end
    
    def bold_green
        colorize("1;32")
    end
    
    def bold_yellow
        colorize("1;33")
    end
    
    def bold_blue
        colorize("1;34")
    end
    
    def bold_magenta
        colorize("1;35")
    end
    
    def bold_cyan
        colorize("1;36")
    end
    
    def bold_white
        colorize("1;37")
    end
    
end
