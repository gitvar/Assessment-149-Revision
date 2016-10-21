class Pet
  def swim
    'swimming!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark bark!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    %Q{Can't swim!}
  end
end

class Cat < Pet
  def speak
    %Q[meow meow!]
  end

  def swim
    %Q[Can't swim!]
  end

  def fetch
    %Q[Can't fetch!]
  end
end

karl = Dog.new
puts karl.speak
puts karl.swim
puts karl.fetch
puts
buddy = Bulldog.new
puts buddy.speak
puts buddy.swim
puts buddy.fetch
puts Bulldog.ancestors
puts
kitty = Cat.new
puts kitty.speak
puts kitty.swim
puts kitty.fetch
