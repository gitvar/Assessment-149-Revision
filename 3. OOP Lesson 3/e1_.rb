class Person
  @@total_people = 0            # initialized at the class level

  def self.total_people
    @@total_people              # accessible from class method
  end

  def initialize
    @@total_people += 1         # mutable from instance method
  end

  def total_people
    @@total_people              # accessible from instance method
  end
end

puts Person.total_people             # => 0
Person.new
Person.new
puts Person.total_people             # => 2

bob = Person.new
puts bob.total_people                # => 3

joe = Person.new
puts joe.total_people                # => 4

puts Person.total_people             # => 4
