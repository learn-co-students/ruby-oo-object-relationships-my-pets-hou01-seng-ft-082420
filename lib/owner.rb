require 'pry'
require_relative './cat.rb' 
require_relative './dog.rb'
#billy
class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    self.class.all << self 
  end 

  def say_species
    "I am a human."
  end 

  def self.all
    @@all
  end

  def self.count
    self.all.count 
  end

  def self.reset_all
    self.all.clear()
  end 

  def cats
    #binding.pry
    Cat.all.select{|cats| cats.owner == self}
  end 

  def dogs
    #binding.pry
    Dog.all.select{|dogs| dogs.owner == self}
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end 

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end 

  def walk_dogs
   dogs.each{|pet| pet.mood = "happy"}
  end 

  def feed_cats
    cats.each{|pet| pet.mood = "happy"}
  end 

  def sell_pets
    dogs.each{|pet| pet.mood = "nervous"}
    cats.each{|pet| pet.mood = "nervous"}
    cats.each{|pet| pet.owner = nil}
    dogs.each{|pet| pet.owner = nil}
  end 

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 

end