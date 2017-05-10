class Rps
  def initialize()
    print("Fight versus a monster begin!\n".cyan())
  end

	class Weapon

    end

	class Rock < Weapon
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

	class Paper < Weapon
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

	class Scissors < Weapon
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

  def play(player)
  	weaponsTab = ["Scissors", "Rock", "Paper"]

    index = nil
  	until index != nil do
      weaponChosenName = player.chooseWeapon()
      index = weaponsTab.find_index(weaponChosenName.downcase().capitalize())
      if(index == nil)
        index = weaponsTab.map { |e|  e[0].upcase}.find_index(weaponChosenName.upcase)
      end
      if(index == nil)
        puts "Incorrect input!!!"
      end
  	end

  	randomWeaponName = weaponsTab[rand(3)]
  	print("You chose #{weaponChosenName}, your opponent chose #{randomWeaponName}\n".red())
  	weaponChosen = eval(weaponsTab[index] + ".new")
  	randomWeapon = eval(randomWeaponName + ".new")

  	result = weaponChosen.attack(randomWeapon)
  	if result == 0
        print ("It's a tie!\n".white())
  	elsif result == 1
        print ("You win!\n".white())
  	else
        print ("You lose!\n".white())
  	end
    result
  end

end
