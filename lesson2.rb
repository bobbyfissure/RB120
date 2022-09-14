class Student
  attr_writer :name
  def initialize(name)
    self.name = name
  end 
end

ade = Student.new('Adewale')