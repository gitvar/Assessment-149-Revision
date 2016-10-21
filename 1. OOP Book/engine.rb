# engine.rb

class Engine
  def initialize(type)
    @type = type
  end

  def to_s
    "#{@type}"
  end
end


class Car
  attr_reader :engine

  def initialize(type)
    @engine = Engine.new(type) # @engine is the reference to the engine object.
  end
end

# Usage:
my_car = Car.new("V6") # my_car is the reference to the car object.
puts "My car has a #{my_car.engine} engine."
