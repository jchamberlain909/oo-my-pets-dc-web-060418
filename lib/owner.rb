require 'pry'
class Owner
  attr_accessor :name, :pets
  attr_reader :species
  @@all = []
  def initialize(name)
    @name = name
    @species = 'human'
    @pets = {fishes:[],dogs:[],cats:[]}
    self.class.all << self
  end
  def self.all
    @@all
  end
  def self.reset_all
    self.all.clear
  end
  def self.count
    self.all.length
  end
  def say_species
    "I am a #{self.species}."
  end
  def buy_fish(name)
    fish = Fish.new(name)
    self.pets[:fishes] << fish
  end 
  def buy_cat(name)
    cat = Cat.new(name)
    self.pets[:cats] << cat
  end
  def buy_dog(name)
    dog = Dog.new(name)
    self.pets[:dogs] << dog
  end
  def walk_dogs
    self.pets[:dogs].each do |d|
      d.mood='happy'
    end 
  end 
  def play_with_cats
    self.pets[:cats].each do |c|
      c.mood='happy'
    end 
  end 
  def feed_fish
    self.pets[:fishes].each do |f|
      f.mood='happy'
    end 
  end 
  def sell_pets

    self.pets.values.each do |pet_list|
      pet_list.each do |pet|
        pet.mood = 'nervous'
      end   
    end 
    
    self.pets.clear
  end 

  def list_pets
    
    "I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."
  end 
end