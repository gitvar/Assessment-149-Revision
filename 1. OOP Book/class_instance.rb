class Foo
  @@class_var = 'foo'
  @class_instance_var = 'foo'

  def test
    puts "instance:"
    puts "  class variable: #{@@class_var}"
    puts "  class instance variable: #{@class_instance_var}" # not available here (inside instance method).
  end

  def self.test
    puts "class:"
    puts "  class variable: #{@@class_var}"
    puts "  class instance variable: #{@class_instance_var}"
  end
end

class Bar < Foo
  @@class_var = 'bar'
  @class_instance_var = 'bar'
end

foo = Foo.new
puts "------------"
puts "Foo"
puts "------------"
foo.test
puts "~~~~~~~~~~~~"
Foo.test
#
# puts "------------"
# puts "Bar"
# puts "------------"
# b = Bar.new
# b.test
# puts "~~~~~~~~~~~~"
# Bar.test
