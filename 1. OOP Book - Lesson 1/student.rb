# student.rb

class Student

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  def grade
    @grade
  end
end

pete = Student.new("Pete", 65)
pam = Student.new("Pam", 75)

# puts "Pete's grade = #{pete.grade}." # This line thows an error if the grade method is protected (as it should!).
puts "Pete's grade is better than Pam's grade?: #{pete.better_grade_than?(pam)}."
puts
