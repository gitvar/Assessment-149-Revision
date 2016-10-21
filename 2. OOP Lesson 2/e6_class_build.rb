# e6_class_build.rb

class Person
  attr_accessor :first_name, :last_name

  def initialize(p_name)
    parse_full_name(p_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

    private

  def parse_full_name(p_name)
    @first_name = p_name.split.first
    p_name.split.count > 1 ? @last_name = p_name.split.last : @last_name = ''
  end

  def to_s
    "#{name}"
  end
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
