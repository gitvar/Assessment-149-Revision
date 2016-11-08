# protected.rb

class Human
  def initialize(age)
    @age = age
  end

  def older_than?(other_person)
    my_age > other_person.my_age
  end

  protected

  def my_age
    @age
  end
end

class Person < Human; end

bob = Human.new(74)
pete = Person.new(47)

puts bob.older_than?(pete) # => true
puts "Pete is a Human?: #{pete.is_a?(Human)}."
