class Dog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(name, age)
    self.name = name
    self.age = age * DOG_YEARS # calls attr_accessor method age.
  end

  def public_disclosure
    # "#{self.name} in human years is #{human_years}."
    "#{name} in human years is #{human_years}."
    # Calls private method human_years (NOT self.human_years)
  end

  private # reserved word private

  def human_years
    # self.age / DOG_YEARS
    age / DOG_YEARS
    # Use self.age and not just age to disambiguate between attr_accessor method age and local variable age.
    # Although in this case, age (the attr_accessor method) without self, would have been fine too.
  end
end

sparky = Dog.new('Sparky', 5)
puts sparky.public_disclosure # => Sparky in human years is 35.
