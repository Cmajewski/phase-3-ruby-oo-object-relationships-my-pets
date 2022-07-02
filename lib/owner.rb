class Owner
  # code goes here

  @@all=[]

attr_reader :name, :species
  def initialize(name)
    @name=name
    @species="human"
    @@all<<self
  end 

  def say_species
    "I am a #{self.species}."
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
    Cat.all.select{|cat| cat.owner==self}
  end

  def dogs
    Dog.all.select{|cat| cat.owner==self}
  end

  def buy_dog(name)
    Dog.new(name,self)
  end

  def buy_cat(name)
    Cat.new(name,self)
  end

  def walk_dogs
    dogs.map{|dog| dog.mood="happy"}
  end 

  def feed_cats
    cats.map{|cat| cat.mood="happy"}
  end 

  def pets
    dogs+cats
  end

  def sell_pets
    pets.collect do |pet| pet.mood="nervous"
    end
    pets.collect {|pet|pet.owner=nil}
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end


end
