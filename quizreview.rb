class FarmAnimal
  def speak
    "#{self.class} says "
  end
end

class Sheep < FarmAnimal
  def speak
    super + "baa!"
  end
end

class Lamb < Sheep
  def speak
    super + "baaaaaaa!"
  end
end

class Cow < FarmAnimal
  def speak
    super + "mooooooo!"
  end
end

Sheep.new.speak # => "Sheep says baa!"
Lamb.new.speak # => "Lamb says baa!baaaaaaa!"
Cow.new.speak # => "Cow says mooooooo!"



class Person
  attr_accessor :name, :age
  
  TITLES = ['Mr', 'Mrs', 'Ms', 'Dr']

  @@total_people = 0

  def initialize(name)
    @name = name
  end

  def age
    @age
  end
end

joe = Person.new("Joe")




module Describable
  def describe_shape
    "I am a #{self.class} and have #{self.class::SIDES} sides."
  end
end

class Shape
  
  include Describable

  def self.sides
    self::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4

  def sides
    SIDES
  end
end

class Square < Quadrilateral; end




class Student
  attr_accessor :grade

  def initialize(name, grade=nil)
    @name = name
  end
end

ade = Student.new('Adewale')
ade.grade = nil


module Speedy
  def run_fast
    @speed = 70
  end
end

class Animal
  attr_reader :name, :age
  
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Dog < Animal
  attr_reader :dog_age
  
  DOG_YEARS = 7

  def initialize(name, age)
    super
    @dog_age = age * DOG_YEARS
  end

  def to_s
    "Dog name is #{name}. Dog age is #{age}. Dog age in dog years is #{dog_age}."
  end
end

class Greyhound < Dog
  include Speedy
end

grey = Dog.new('Grey', 3)
puts grey