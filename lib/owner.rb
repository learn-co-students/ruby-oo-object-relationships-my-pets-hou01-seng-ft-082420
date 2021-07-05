require 'pry'

class Owner

  @@all = []
  
  def initialize(name,species="human")
    @name = name
    @species = species
    self.class.all << self
  end

  def name
    @name
  end

  def species
    @species
  end

  def say_species
    return "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select do |owned_cat| 
      owned_cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |owned_dog| 
      owned_dog.owner == self
    end
  end

  def buy_cat(new_cat)
    Cat.new(new_cat, self)
  end

  def buy_dog(new_dog)
    Dog.new(new_dog, self)
  end

  def walk_dogs
    self.dogs.each do |dog| 
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |my_cats|
      my_cats.mood = "happy"
    end
  end

  def sell_pets
    self.cats.each do |cats|
      cats.mood = "nervous"
    end
    self.dogs.each do |dogs|
      dogs.mood = "nervous"
    end
    self.cats.each do |cats|
      cats.owner = nil
    end
    self.dogs.each do |dogs|
      dogs.owner = nil
    end
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end






