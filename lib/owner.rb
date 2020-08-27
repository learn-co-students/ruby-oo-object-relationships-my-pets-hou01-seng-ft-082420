class Owner
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name 
    @@all << self
  end

  def species
    @species = "human"
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
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

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each do |x|
      x.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |x|
      x.mood = "happy"
    end
  end

  def sell_pets
    self.cats.each do |x|
      x.mood = "nervous"
    end

    self.dogs.each do |x|
      x.mood = "nervous"
    end

    self.cats.each do |x|
      x.owner = nil
    end

    self.dogs.each do |x|
      x.owner = nil
    end
    
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end