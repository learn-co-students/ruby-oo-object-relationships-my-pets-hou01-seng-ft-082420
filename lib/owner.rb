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

end