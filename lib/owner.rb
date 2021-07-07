class Owner
  @@all = []

  attr_reader :name, :species

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    #returns the number of owners that have been created
    self.all.count
  end

  def self.reset_all
    #resets the owners that have been created
    self.all.clear
  end

  def cats
    # returns a collection of all the cats that belong to the owner
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(name)
    #buy a cat that is an INSTANCE of the Cat class, knows about its cats
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    #walks the dogs which makes the dogs' moods happy
    self.dogs.each{ |dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each{ |cat| cat.mood = "happy"}
  end

  def sell_pets
    pets = self.cats + self.dogs

    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end

    def list_pets
      "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end

  end




end