# animals.rb

class Animal

  @@number_of_animals = 0

  attr_reader :name

  def initialize(name)
    @name = name
    @@number_of_animals += 1
  end

  def speak
    "Hello!"
  end

  def fetch(object)
    "#{name} is fetching the #{object}!"
  end

  def self.number_of_animals
    @@number_of_animals
  end
end

class Dog < Animal
  def initialize(name)
    super(name)
  end

  def speak # Override the super class' speak method.
    "#{self.name} says arf!"
  end

  def fetch(object)
    super(object) + " #{name} is excited!"
  end
end

class Cat < Animal
  def initialize(name)
    super(name)
  end
end

sparky = Dog.new("Sparky")
puts sparky.speak           # => Sparky says arf!
puts sparky.fetch("stick")
puts "The number of Animal instances = #{Animal.number_of_animals}."
puts

garfield = Cat.new("Garfield")
puts "#{garfield.name} says '#{garfield.speak}'"
puts garfield.fetch("fuzzy ball")
puts "The number of Animal instances = #{Animal.number_of_animals}."
puts

puts "Now deleteing #{garfield.name} with the command: 'garfield = nil'"
garfield = nil
puts "Checking to see if Garfield is still in the memory somewhere..."
puts "What is your name? #{garfield.name}"
