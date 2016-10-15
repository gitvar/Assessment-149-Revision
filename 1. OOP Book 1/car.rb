# Create a class called MyCar. When you initialize a new instance or object of
# the class, allow the user to define some instance variables that tell us the
# year, color, and model of the car. Create an instance variable that is set
# ro `0` during instantiation of the object to track the current speed of the
# car as well. Create instance methods that allow the car to speed up, brake,
# and shut the car off.

require 'time'

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

class Car
  include StandardServicePlan

  # Using class instance var instead of class var because of rubocop.
  # rubocop does not like class vars!
  @number_of_cars = 0 # Change Class Var to Class Instance Variable.

  attr_reader :year, :model, :speed, :engine_status, :colour
  attr_reader :current_gear, :handbreak

  def initialize(year, colour, model)
    # @number_of_cars += 1 # class instce var not available in instance method.
    @year = year
    @colour = colour
    @model = model
    @speed = 0
    @handbreak = :on
    @gears = [:reverse, :neutral, :first, :second, :third, :fourth, :fifth]
    @current_gear = :neutral
    @engine_status = :off
  end

  # Comment out because class instance var not available via instance Method.
  # def total_number_of_cars # Instance Method
  #   @number_of_cars
  # end

  def self.increment_no_of_cars
    @number_of_cars += 1
  end

  def self.total_number_of_cars # Class Method
    @number_of_cars
  end

  def self.what_am_i # Class Method
    puts "I am a Car class."
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
    @current_gear = @gears[gear_index + 1] unless current_gear == :fifth
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

  def to_s
    "My car is a #{model} (overriding the .to_s method)."
  end
end

my_toyota = Car.new(2015, 'silver', 'Toyota Yaris')
Car.increment_no_of_cars

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

my_volkswagen = Car.new(1983, 'Yellow', 'VW Golf')
Car.increment_no_of_cars
puts "My 2nd car is a: #{my_volkswagen.model}."
puts "My #{my_volkswagen.model}'s color is #{my_volkswagen.colour}."
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
