#Lesson 2 
#Classes and Objects

#1

# class Person
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end
# end

# bob = Person.new('bob')
# puts bob.name                  # => 'bob'
# bob.name = 'Robert'
# puts bob.name                  # => 'Robert'


#2/3

# class Person
#   #attr_reader :first_name
#   attr_accessor :last_name, :name, :first_name
  
#   def initialize(name)
#     @first_name, @last_name = name.split
#     @name = name
#   end

#   def name=(name)
#     @first_name, @last_name = name.split
#     @name = name
#   end
# end

# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# # p bob.first_name            # => 'Robert'
# # p bob.last_name             # => ''
# # bob.last_name = 'Smith'
# # p bob.name


# bob.name = "John Adams"
# p bob.first_name            # => 'John'
# p bob.last_name  

#4/5

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(full_name)
#     parse_full_name(full_name)
#   end

#   def name
#     "#{first_name} #{last_name}".strip
#   end

#   def name=(full_name)
#     parse_full_name(full_name)
#   end

#   def to_s
#     name
#   end

#   protected

#   def ==(other)
#     name == other.name
#   end

#   private

#   def parse_full_name(full_name)
#     parts = full_name.split
#     self.first_name = parts.first
#     self.last_name = parts.size > 1 ? parts.last : ''
#   end
# end

# bob = Person.new('Robert Smith')
# rob = Person.new('Robert Smith')

# bob = Person.new("Robert Smith")
# puts "The person's name is: #{bob}"

#Inheritance

#1

# class Dog
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end
# end

# class Bulldog < Dog
#   def swim
#     "I can't swim"
#   end
# end

# teddy = Dog.new
# puts teddy.speak           # => "bark!"
# puts teddy.swim           # => "swimming!

#3

# class Pet
#   def run
#     'running!'
#   end

#   def jump
#     'jumping!'
#   end
# end


# class Dog < Pet
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end

#   def fetch
#     'fetching!'
#   end
# end

# class Cat < Pet
#   def speak
#     'meow!'
#   end
# end

#Lesson 4

#Easy I

# class FarmAnimal
#   def speak
#     "#{self.class} says "
#   end
# end

# class Sheep < FarmAnimal
#   def speak
#     super + "baa!"
#   end
# end

# class Lamb < Sheep
#   def speak
#     "baaaaaaa!"
#   end
# end

# class Cow < FarmAnimal
#   def speak
#     super + "mooooooo!"
#   end
# end

# p Sheep.new.speak # => "Sheep says baa!"
# p Lamb.new.speak # => "Lamb says baa!baaaaaaa!"
# p Cow.new.speak # => "Cow says mooooooo!"

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
end

class Square < Quadrilateral; end

p Square.sides # => 4
p Square.new.sides # => 4
p Square.new.describe_shape # => "I am a Square and have 4 sides.