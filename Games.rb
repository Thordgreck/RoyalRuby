class Rps
  def initialize()
    print("Fight versus a monster begin!\n")
  end

	class Weapon # \o/
	end

	class Rock<Weapon
		def initialize
		  @name = "Rock"
		end

		def get_name
		  return @name
		end

		def attack(weapon)
		  return weapon.evalRock(weapon)
		end

		def evalPaper(weapon)
		  return 1
		end

		def evalRock(weapon)
		  return 0
		end

		def evalScissors(weapon)
		  return -1
		end
	end

	class Paper<Weapon
		def initialize
		  @name = "Paper"
		end

		def get_name
		  return @name
		end

		def attack(weapon)
		  return weapon.evalPaper(weapon)
		end

		def evalPaper(weapon)
		  return 0
		end

		def evalRock(weapon)
		  return -1
		end

		def evalScissors(weapon)
		  return 1
		end
	end

	class Scissors<Weapon
		def initialize
		  @name = "Scissors"
		end

		def get_name
		  return @name
		end

		def attack(weapon)
		  return weapon.evalScissors(weapon)
		end

		def evalPaper(weapon)
		  return -1
		end

		def evalRock(weapon)
		  return 1
		end

		def evalScissors(weapon)
		  return 0
		end
	end

  def play()
  	weaponsTab = ["Scissors", "Rock", "Paper"]

    index = nil
  	until index != nil do
      puts "Make your choice between Rock (r), Paper (p) or Scissors (s) :"
      weaponChosenName = gets.chomp
      index = weaponsTab.find_index(weaponChosenName.downcase().capitalize())
      if(index == nil)
        index = weaponsTab.map { |e|  e[0].upcase}.find_index(weaponChosenName.upcase)
      end
      if(index == nil)
        puts "incorrect input"
      end
  	end
  	randomWeaponName = weaponsTab[rand(3)]
  	print("You chose #{weaponChosenName}, your opponent chose #{randomWeaponName}\n")

  	weaponChosen = eval(weaponsTab[index] + ".new")
  	randomWeapon = eval(randomWeaponName + ".new")

  	result = weaponChosen.attack(randomWeapon)
  	# if result == 0
  	# 	print ("It's a tie!\n")
  	# elsif result == 1
  	# 	print ("You win!\n")
  	# else
  	# 	print ("Your opponent wins!\n")
  	# end
    result
  end

end
