require 'pry'

class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []
  def initialize (name)
    @name = name 
    @species = "human"
    self.class.all << self 
  end

  def say_species 
    "I am a #{@species}."
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
    Cat.all.select {|cats| cats.owner == self   }
    #binding.pry
  end 

  def dogs
      Dog.all.select {|dogs| dogs.owner == self }
  end 

  def buy_cat (name)
    Cat.new(name, self)
  end

  def buy_dog (name)
    Dog.new(name, self)
  end 

  def walk_dogs 
    self.dogs.each {|dogs| dogs.mood = "happy"}
  end

  def feed_cats 
    self.cats.each {|cats| cats.mood = "happy"}
  end

  def sell_pets 
    self.dogs.map {|dogs| dogs.mood = "nervous"}
    self.dogs.each {|dogs| dogs. owner = nil }
    
  
    self.cats.map {|cats| cats.mood = "nervous"}
    self.cats.each{|cats| cats.owner = nil}
    #binding.pry
  end 

  def list_pets 
    #self.dogs.count
    #self.cats.count 
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end


0