# e3_class_build.rb

class Person
  attr_accessor :first_name, :last_name

  def initialize(p_name)
    @first_name = p_name.split.first
    p_name.split.count > 1 ? @last_name = p_name.split.last : @last_name = ''
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    if full_name.split.count == 1
      name
    else
      @first_name = full_name.split.first
      @last_name = full_name.split.last
    end
  end
end

bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
puts bob.first_name            # => 'John'
puts bob.last_name             # => 'Adams'
