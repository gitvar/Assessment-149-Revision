# e2_class_build.rb

class Person
  attr_accessor :first_name, :last_name

  def initialize(p_name)
    @first_name = p_name.split.first
    p_name.split.count > 1 ? @last_name = p_name.split.last : @last_name = ''
  end

  def name
    "#{first_name} #{last_name}".strip
  end
end


bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'
