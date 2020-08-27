class Cat

  #attr_accessor :owner, :mood

  @@all = []
  
  def initialize(name, owner, mood="nervous")
    @name = name
    @owner = owner
    @mood = mood
    self.class.all << self
  end

  def name
    @name
  end

  def self.all
    @@all
  end


  def owner
    @owner
  end

  def owner=(new_owner)
    @owner = new_owner
  end

  def mood
    @mood
  end

  def mood=(new_mood)
    @mood = new_mood
  end





  end