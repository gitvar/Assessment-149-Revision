module Maintianable
  def change_tires
    # "Changing #{WHEELS} tires." # 1. Error!
    # "Changing #{Vehicle::WHEELS} tires." # 2. Will work.
    "Changing #{Car::WHEELS} tires." # 3. Will work!
  end
end

class Vehicle
  WHEELS = 4
end

class Car < Vehicle
  include Maintianable
end

a_car = Car.new
puts a_car.change_tires # 1. Above => NameError: uninitialized constant Maintainable::WHEELS
