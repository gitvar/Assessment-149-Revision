# frozen_string_literal: true
#
# Create a class called MyCar. When you initialize a new instance or object of
# the class, allow the user to define some instance variables that tell us the
# year, color, and model of the car. Create an instance variable that is set
# ro `0` during instantiation of the object to track the current speed of the
# car as well. Create instance methods that allow the car to speed up, brake,
# and shut the car off.

require 'time'

# StandardServicePlan is an example of a Module.
module StandardServicePlan

  SERVICE_PLAN_IN_YEARS = 5

  def months_remaining_on_service_plan(year_of_manufacture)
    this_year = Time.now.year
    years_remaining = (year_of_manufacture + SERVICE_PLAN_IN_YEARS) - this_year
    if years_remaining <= 0
      0
    else
      years_remaining * 12
    end
  end
end

module Towable
  def is_towable?(weight_in_kilograms)
    weight_in_kilograms < 2000 ? true : false
  end
end

class Vehicle

  NUMBER_OF_ENGINES = 1

  @@no_of_vehicles = 0

  attr_reader :year, :model, :speed, :engine_status, :colour
  attr_reader :weight, :current_gear, :handbreak

  def initialize(year, colour, model)
    @@no_of_vehicles += 1
    @year = year
    @colour = colour
    @model = model
    @speed = 0
    @handbreak = :on
    @gears = [:reverse, :neutral, :first, :second, :third, :fourth]
    @current_gear = :neutral
    @engine_status = :off
    @weight = 0
  end

  def self.no_of_vehicles
    @@no_of_vehicles
  end

  def self.gas_milage(distance_in_miles, gallons_of_gas)
    distance_in_miles / gallons_of_gas
  end

  def spray_paint(colour) # Instance Method
    @colour = colour
  end

  def shift_up
    return if current_gear == :reverse || engine_status == :off
    gear_index = @gears.index(current_gear)
    @current_gear = @gears[gear_index + 1] unless current_gear == @gears.last
    @speed += 30 unless @speed >= 150
  end

  def shift_down
    return if current_gear == :reverse || engine_status == :off
    gear_index = @gears.index(current_gear)
    @current_gear = @gears[gear_index - 1] unless current_gear == :neutral
    @speed -= 30 unless @speed <= 30
  end

  def handbreak_on
    @handbreak = :on
  end

  def handbreak_off
    @handbreak = :off
  end

  def engine_off
    return unless @speed.zero? && current_gear == :neutral
    @engine_status = :off
  end

  def engine_on
    return unless @speed.zero? && current_gear == :neutral
    @engine_status = :running
  end

  def stop
    @current_gear = :neutral
    @speed = 0
  end

  def reverse
    return unless [:neutral, :reverse].include?(current_gear)
    @current_gear = :reverse
    @speed -= 10 unless @speed <= -40
  end

  def break
    if speed > 10
      @speed -= 10
    elsif speed < -10
      @speed += 10
    else
      @speed = 0
    end
  end

  def vehicle_age
    age
  end

  def no_of_engines
    NUMBER_OF_ENGINES
  end

  private

  def age
    Time.now.year - @year
  end
end

class Truck < Vehicle
  include StandardServicePlan
  include Towable

  SLEEPER_CABIN = true
  NO_OF_WHEELS = 18
  NUMBER_OF_ENGINES = 2

  def initialize(year, colour, model)
    super(year, colour, model)
    @weight = 5000
  end

  def no_of_wheels?
    NO_OF_WHEELS
  end

  def no_of_engines
    NUMBER_OF_ENGINES
  end
end

# Car is an example of a class implementation.
class Car < Vehicle
  include StandardServicePlan
  include Towable

  @@no_of_cars = 0

  NO_OF_WHEELS = 4

  def initialize(year, colour, model)
    super(year, colour, model)
    @@no_of_cars += 1
    @gears = [:reverse, :neutral, :first, :second, :third, :fourth, :fifth]
    @weight = 1500
  end

  def has_a_boot?
    BOOT
  end

  def no_of_wheels?
    NO_OF_WHEELS
  end

  def self.total_number_of_cars # Class Method
    @@no_of_cars
  end

  def self.what_am_i # Class Method
    puts "I am a Car class."
  end

  def to_s
    "My car is a #{model} (overriding the .to_s method)."
  end
end

my_toyota = Car.new(2015, 'silver', 'Toyota Yaris')

puts "My Car:"
puts "Colour = #{my_toyota.colour}."
puts "Gear = #{my_toyota.current_gear}."
puts "The handbreak is #{my_toyota.handbreak}."
puts "The speed is #{my_toyota.speed} km/h."
puts "The engine is #{my_toyota.engine_status}."
puts

puts "Switching the engine on."
if my_toyota.engine_on
  puts "The engine is now #{my_toyota.engine_status}"
else
  puts "The engine is #{my_toyota.engine_status}"
end

puts "Now pulling away!"
my_toyota.handbreak_off
puts "The handbreak is #{my_toyota.handbreak}."

4.times do
  puts "Shifting up!"
  my_toyota.shift_up
  puts "Gear = #{my_toyota.current_gear}."
  puts "The speed is #{my_toyota.speed} km/h."
  puts
end

2.times do
  puts "Breaking."
  my_toyota.break
  puts "Gear = #{my_toyota.current_gear}."
  puts "The speed is #{my_toyota.speed} km/h."
  puts
end

puts "Attempting to reverse."
my_toyota.reverse
puts "The handbreak is #{my_toyota.handbreak}."
puts "Gear = #{my_toyota.current_gear}."
puts "The speed is #{my_toyota.speed} km/h."
puts

2.times do
  my_toyota.shift_down
  puts "Gear = #{my_toyota.current_gear}."
  puts "The speed is #{my_toyota.speed} km/h."
  puts
end

puts "Stopping!"
my_toyota.stop
while my_toyota.current_gear > :neutral
  my_toyota.shift_down
  puts "Gear = #{my_toyota.current_gear}."
end

my_toyota.handbreak_on
puts "The speed is #{my_toyota.speed} km/h."
puts "The handbreak is #{my_toyota.handbreak}."
puts

my_toyota.handbreak_off
2.times do
  my_toyota.reverse
  puts "Attempting to reverse."
  puts "The handbreak is #{my_toyota.handbreak}."
  puts "Gear = #{my_toyota.current_gear}."
  puts "The speed is #{my_toyota.speed} km/h."
  puts
end

2.times do
  puts "Breaking."
  my_toyota.break
  puts "Gear = #{my_toyota.current_gear}."
  puts "The speed is #{my_toyota.speed} km/h."
  puts "The handbreak is #{my_toyota.handbreak}."
  puts
end

puts "Stopping!"
my_toyota.stop
my_toyota.handbreak_on
puts "Gear = #{my_toyota.current_gear}."
puts "The speed is #{my_toyota.speed} km/h."
puts "The handbreak is #{my_toyota.handbreak}."
puts

puts "Switching off."
my_toyota.engine_off
puts "The engine is #{my_toyota.engine_status}."
puts

puts "Spray painting my car: Colour = blue!"
my_toyota.spray_paint("Blue")
puts "My car's colour is now: #{my_toyota.colour}."
puts

remaining_plan = my_toyota.months_remaining_on_service_plan(my_toyota.year)
puts "There are #{remaining_plan} months left of the maintenance plan."
puts

puts "My car is a #{my_toyota.class} class."
puts "My car's ancestor classes are: #{Car.ancestors}."
puts

puts "Now asking the Car class what it is => 'Car.what_am_i'"
puts " #{Car.what_am_i}"
puts

puts my_toyota
puts

my_vw = Car.new(1983, 'Yellow', 'VW Golf')
puts "My 2nd car is a: #{my_vw.model}."
puts "My #{my_vw.model}'s color is #{my_vw.colour}."
puts

# Class method call:
puts "The number of Car instances = #{Car.total_number_of_cars}"
puts

# Comment out because class instance var not available via instance method.
# Instance method call:
# puts "The number of Car instances = #{my_toyota.total_number_of_cars}"
# puts

puts "One of my cars' gas milage = #{Car.gas_milage(466, 11)} miles/gallon."
puts

puts "My #{my_toyota.model} has #{my_toyota.no_of_wheels?} wheels."
puts

my_truck = Truck.new(1999, "White", "Hino")
puts "My truck has #{my_truck.no_of_wheels?} wheels."
puts

puts "The number of Vehicle instances created = #{Car.no_of_vehicles}."
puts "I have #{Car.total_number_of_cars} cars."
puts

puts "Is my #{my_vw.model} towable?: #{my_vw.is_towable?(my_vw.weight)}."
# puts "Is my #{my_truck.model} towable?: #{my_truck.is_towable?(my_truck.weight)}."
puts

puts Vehicle.ancestors.to_s
puts
puts Truck.ancestors.inspect
puts
puts "#{Car.ancestors}"
puts

puts "My VW is #{my_vw.vehicle_age} years old."
puts

puts "My #{my_truck.model} has #{my_truck.no_of_engines} engine(s)."
puts
