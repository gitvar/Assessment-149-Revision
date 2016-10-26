class Dog
  LEGS = 4
end

class Cat
  def legs
    # LEGS # Will throw an error! 
    Dog::LEGS # We can reach into the Dog class and reference its PUBLIC constants and PUBLIC methods in this way!
  end
end

kitty = Cat.new
puts kitty.legs
