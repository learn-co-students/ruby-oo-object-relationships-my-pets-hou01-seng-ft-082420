class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []

  def initialize(name, species= "human")
    @name = name
    @species = species
    self.class.all << self 
  end

  def say_species
    "I am a #{self.species}."
  end
  
  def self.all
    @@all 
  end
  def self.count
    self.all.size
  end
  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end
  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end
  def all_pets
    self.dogs.concat(self.cats)
  end

  def buy_cat(name)
    Cat.new(name, self)
  end
  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.select do |dog|
      dog.mood = "happy"
    end
  end
  def feed_cats
    self.cats.select do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.all_pets.select do |pet|
      pet.mood = "nervous"
      pet.owner = nil 
    end
  end 

  def list_pets
    "I have #{self.dogs.size} dog(s), and #{self.cats.size} cat(s)."
  end

end