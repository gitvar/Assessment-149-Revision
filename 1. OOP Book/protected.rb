# protected.rb

class Person

  def initialize(age)
    @age = age
  end

  def older_than?(other_person)
    age > other_person.age
  end

  protected

  def age
    @age
  end
end

bob = Person.new(74)
pete = Person.new(47)

puts bob.older_than?(pete)

# => true
