class Vehicle
  WHEELS = 4
end

class Car < Vehicle
  attr_reader :year, :model

  def initialize(model, year)
    @model = model
    @year = year
  end

  def ==(other_car)
    model == other_car.model
  end

  def >(other_car)
    year < other_car.year # Older than in years means smaller than!
  end
end

a_car = Car.new("T", 1936)
b_car = Car.new("VW Golf", 1980)

puts a_car == b_car # => flase
puts a_car != b_car # The != fake operator (method) is free! => true

puts a_car > b_car # true
