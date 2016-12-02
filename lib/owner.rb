require 'pry'

class Owner
  # code goes here
  	attr_accessor :name, :mood, :pets
	attr_reader :species

	@@all = []

	def initialize(name)
		@name = name
		@species = "human"
		@pets = {:fishes => [], :dogs => [], :cats => []}
		@@all << self
	end

	def self.all 
		@@all 
	end

	def self.reset_all
		self.all.clear
	end

	def self.count
		self.all.count
	end

	def say_species
		"I am a #{species}."
	end

	def buy_fish(name)
		fish = Fish.new(name)
		@pets[:fishes] << fish
	end

	def buy_dog(name)
		dog = Dog.new(name)
		@pets[:dogs] << dog
	end

	def buy_cat(name)
		cat = Cat.new(name)
		@pets[:cats] << cat
	end

	def change_mood(array,new_mood)
		array.each {|pet| pet.mood = new_mood}
	end

	def walk_dogs
		change_mood(@pets[:dogs], "happy")
	end

	def play_with_cats
		change_mood(@pets[:cats], "happy")
	end

	def feed_fish
		change_mood(@pets[:fishes], "happy")
	end

	def all_pets
		pets.collect { |species,array_of_pets| array_of_pets}.flatten
	end

	def sell_pets
		change_mood(all_pets, "nervous")
		pets.clear
	end

	def count_pets
		pets.each_with_object({}) { |(pet,array_of_pets), hash| hash[pet] = array_of_pets.count }
	end

	def list_pets
		"I have #{count_pets[:fishes]} fish, #{count_pets[:dogs]} dog(s), and #{count_pets[:cats]} cat(s)."
	end

end




