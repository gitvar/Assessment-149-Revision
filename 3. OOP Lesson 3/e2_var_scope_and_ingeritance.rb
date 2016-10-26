class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name, type, age)
    super(name) # Pass super what it wants!
    @type = type
    @age = age
  end

  def dog_name
    "bark! bark! #{@name} bark! bark!"    # can @name be referenced here?
  end
end

teddy = Dog.new("Teddy", "Doberman", 7)
puts teddy.dog_name
