class Person
  attr_accessor :fullname

  def initialize(fullname, age)
    @fullname = fullname
    @age = age
  end
end

class Team
  attr_accessor :name, :members

  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end
end

cowboys = Team.new("Dallas Cowboys")

emmitt = Person.new("Emmitt Smith", 46)
peter = Person.new("Peter Parker", 24)

cowboys << emmitt
cowboys << peter

cowboys.members.each { |person| puts person.fullname }
