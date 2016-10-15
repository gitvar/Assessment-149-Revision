# inherit_1.rb
# An inheritance example in Ruby:

class Animal
  def initialize(name)
    @name = name
  end

  def speak
    "Animal noise..."
  end
end

class Dog < Animal # Dog inherits from Animal.
  def initialize(name, breed)
    super(name) # Pass the variable to the super-class' initialize() method.
    # super     # Otherwise, 'breed' COULD be used by both Animal and Dog.
    @breed = breed
  end

  def speak
    "Woof!"
  end

  def to_s
    "My dog, a #{@breed}, is called #{@name}"
    # "My dog, a #{@breed}."
  end
end

class Cat < Animal # Cat inherits from Animal.
  def initialize(name, colour)
    super(name) # Pass the variable to the super-class' initialize() method.
    @colour = colour
  end

  def to_s
    "My cat's name is #{@name}, and he's a #{@colour} cat."
  end
end

sparky = Dog.new("Sparky", "Collie")
# sparky = Dog.new("Collie")

whiskers = Cat.new("Whiskers", "black")

puts sparky
puts "Sparky, say 'Hello!': #{sparky.speak}"
puts
puts whiskers
puts "Whiskers, say 'Hello!': #{whiskers.speak}"
