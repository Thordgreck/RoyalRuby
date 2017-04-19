class rps
  def initialize()
    print("Started a Rock-Paper-Scissors game\n")
  end

	class Weapon
		
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


	puts "Game started"
	weaponsTab = ["Scissors", "Rock", "Paper"]
	puts "Make your choice between Rock, Paper or Scissors"
	weaponChosenName = nil
	until weaponsTab.include?(weaponChosenName) do
		weaponChosenName = gets.chomp
	end
	randomWeaponName = weaponsTab[rand(3)]
	print "You chose #{weaponChosenName}, your opponent chose #{randomWeaponName}\n"

	weaponChosen = eval(weaponChosenName + ".new")
	randomWeapon = eval(randomWeaponName + ".new")


	result = weaponChosen.attack(randomWeapon)
	if result == 0
		print "It's a tie!\n"
	elsif result == 1
		print "You win!\n"
	else
		print "Your opponent wins!\n"
	end

end
