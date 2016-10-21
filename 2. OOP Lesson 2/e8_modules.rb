# e8_modules.rb

module Swim
  def swim
    "swimming!"
  end
end

module Fly
  def Fly
    "flying!"
  end
end

class Dog
  include Swim
  include Fly
  # ... rest of class omitted
end

class Fish
  include Swim
  # ... rest of class omitted
end

class Bulldog < Dog
  def swim
    "Bulldogs can't swim!"
  end
end

bud = Bulldog.new
puts bud.swim
puts
rex = Dog.new
puts rex.swim
puts
p Bulldog.ancestors
puts
p Dog.ancestors
