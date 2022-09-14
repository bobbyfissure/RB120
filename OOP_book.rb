# #Introductory Chapter

# # module Speak
# #   def speak(sound)
# #     puts "#{sound}"
# #   end
# # end

# # class GoodDog
# #   include Speak
# # end

# # class Human
# #   include Speak
# # end

# # "---GoodDog ancestors---"
# # GoodDog.ancestors

# #  "---Human ancestors---"
# # Human.ancestors

# #Ex 1.1

# module DeclareWinner
#   def declare_winner(winner)
#      "#{winner} is the winner!"
#   end
# end

# class Games
#   include DeclareWinner
# end

# chess = Games.new
# chess.declare_winner("Stockfish 15")
# dota_2 = Games.new
# dota_2.declare_winner("PSG LGD")
# #1.2

# #Modules enable classes to access and share common methods. For example, both humans and dogs speak - or 
# #at the least both make noise using their mouth. By mixing in the Speak module we allowed 
# #each class to access the speak method. This is a classic case of polymorphism.


# #Classes + Objects I

# # class GoodDog
# #   attr_accessor :name, :height, :weight
  
# #   def initialize(n, h, w)
# #     @name = n
# #     @height = h
# #     @weight = w 
# #   end

# #   def change_info(n, h, w)
# #     self.name = n
# #     self.height = h 
# #     self.weight = w 
# #   end

# #   def speak
# #     "#{name} says 'Arf'"
# #   end

# #   def info
# #     "#{self.name} weighs #{self.weight} kilo and is #{self.height} cms tall."
# #   end
# # end

# # fido = GoodDog.new("Fido", 22, 57)
# # fido.speak
# # luka = GoodDog.new("Luka", 41, 15)
# # luka.speak
# # luka.name
# # luka.name = "Luka Barebie"
# # luka.change_info("Luka Kerner", 42, 20)
# # luka.info


# #Ex 2.1

# class MyCar

#   attr_accessor :color
#   attr_reader :year

#   def initialize(y, c, m)
#     @year = y 
#     @color = c
#     @model = m 
#     @speed = 0
#   end

#   def speed_up(number)
#     @speed += number
#     puts "You accelerate to #{@speed} kph."
#   end

#   def slow_down(number)
#     @speed -= number
#     puts "You decelerate to #{@speed} kph."
#   end

#   def current_speed
#     puts "You are now traveling at #{@speed} kph."
#   end

#   def spray_paint=(color)
#     self.color = color
#     puts "Your new #{color} paint job looks great."
#   end

#   def info
#     puts "your car's color is #{self.color}"
#   end

# end

# old_car = MyCar.new(2001, "red", "Corolla")
# old_car.spray_paint = "blue"
# old_car.info

# class GoodDog

#   def self.what_am_i
#     "I'm a good dog!"
#   end
# end


# class GoodDog
#   @@number_of_dogs = 0

#   def initialize
#     @@number_of_dogs += 1
#   end

#   def self.total
#     @@number_of_dogs
#   end
# end

# GoodDog.total #=> 0

# luka = GoodDog.new
# nahmania = GoodDog.new

# GoodDog.total #=> 2


# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     self.name = n 
#     self.age = a * DOG_YEARS
#   end
# end

# luka = GoodDog.new("Luka", 3)
# luka.age

# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     @name = n 
#     @age = a * DOG_YEARS
#   end

#   # def to_s
#   #   "This dog's name is #{@name} and its age is #{@age}."
#   # end
# end

# nahmania = GoodDog.new("Nahmania", 6)

# class GoodDog
#   attr_accessor :name, :height, :weight

#   def initialize(n, h, w)
#     self.name = n 
#     self.height = h 
#     self.weight = w
#   end

#   def change_info(n, h, w)
#     self.name = n 
#     self.height = h 
#     self.weight = w 
#   end

#   def info
#     "Good dog's name is #{self.name}. Their height is #{self.height} cm. Their weight is #{self.weight} kg."
#   end

#   def what_is_self
#     self
#   end
# end

# luka = GoodDog.new("Luka", 55, 25)
# p luka.what_is_self


# class Animal
#   def speak
#     "Hello!"
#   end
# end

# class GoodDog < Animal

#   def speak
#     super + " from GoodDog class."
#   end
# end

# class GoodCat < Animal
# end

# luka = GoodDog.new
# nova = GoodCat.new
# p luka.speak
# p nova.speak

# class Animal
#   attr_accessor :name
  
#   def initialize(n)
#     @name = n
#   end
# end

# class GoodDog < Animal
#   def initialize(color, name)
#     super(name)
#     @color = color
#   end
# end

# animal = Animal.new("Bruno")
# bruno = GoodDog.new("brown", "Bruno")

# class BadDog < Animal
#   def initialize(name, age)
#     super(name)
#     @age = age
#   end
# end

# jake = BadDog.new("Jake", 3)
# p jake


# class Animal
#   def initialize
#   end
# end

# class BadDog < Animal
#   def initialize(color)
#     super()
#     @color = color
#   end
# end

# jake = BadDog.new("spotted")
# p jake


# module Swimmable
#   def swim 
#     "I'm swimming!"
#   end
# end

# class Animal; end

# class Fish < Animal
#   include Swimmable
# end

# class Mammal < Animal
# end

# class Cat < Mammal
# end

# class Dog < Mammal
#   include Swimmable
# end

# sparky = Dog.new
# nova = Cat.new
# nemo = Fish.new

# module Swimmable
#   def swim
#     "I'm swimming."
#   end
# end

# module Climbable
#   def climb 
#     "I'm climbing"
#   end
# end

# module Walkable
#   def walk 
#     "I'm walking"
#   end
# end

# class Animal
#   include Walkable
#   def speak
#     "I'm an animal and I'm speaking."
#   end
# end

# class GoodDog < Animal
#   include Walkable
#   include Swimmable
# end


# module Mammal
#   class Dog
#     def speak(sound)
#       p "#{sound}"
#     end
#   end

#   class Cat
#     def say_name(name)
#       p "#{name}"
#     end
#   end

#   def self.some_out_of_place_method(number)
#     number ** 2
#   end
# end

# value = Mammal.some_out_of_place_method(4)
# other_value = Mammal::some_out_of_place_method(3)
# p other_value
# # buddy = Mammal::Dog.new
# # kitty = Mammal::Cat.new
# # buddy.speak("Arf")
# # kitty.say_name("Toppie")

class Parent
  def say_hi
    p "Hi from Parent"
  end
end

# class Child < Parent
#   def say_hi
#     p "Hi from Child"
#   end

#   def instance_of?
#     p "I'm a fake instance"
#   end
  
# end

# heir = Child.new
# p heir.instance_of? Child


#Exercises ch. 2

class Vehicle
  attr_accessor :color
  attr_reader :year

  @@number_of_vehicles = 0

  def self.gas_mileage(gas_in_gallons, miles_traveled)
    "Your vehicle gets #{(miles_traveled/gas_in_gallons).to_f} miles/gallon"
  end

  def initialize(y, c, m)
    @year = y 
    @color = c
    @model = m 
    @speed = 0
    @@number_of_vehicles += 1
  end

  def speed_up(number)
    @speed += number
    puts "You accelerate to #{@speed} kph."
  end

  def slow_down(number)
    @speed -= number
    puts "You decelerate to #{@speed} kph."
  end

  def current_speed
    puts "You are now traveling at #{@speed} kph."
  end


  def spray_paint=(color)
    self.color = color
    puts "Your new #{color} paint job looks great."
  end

  def info
    puts "your car's color is #{self.color}"
  end

  def self.total_number_of_vehicles
    @@number_of_vehicles
  end

  def to_s
    puts "My car is a #{@color} #{@year} #{@model}."
  end
end

blue_ford = Vehicle.new("2018", "blue", "F150")
blue_ford.to_s


#Exercises ch. 3

# module OffRoadAble
#   def offroad 
#     "I can travel offroad."
#   end
# end

# module EasyCityParkAble
#   def easy_city_park
#     "I can easily park on city streets."
#   end
# end

# class Vehicle
#   attr_accessor :color
#   attr_reader :year

#   @@number_of_vehicles = 0

#   def initialize(y, c, m)
#     @year = y 
#     @color = c
#     @model = m 
#     @speed = 0
#     @@number_of_vehicles += 1
#   end

#   def speed_up(number)
#     @speed += number
#     puts "You accelerate to #{@speed} kph."
#   end

#   def slow_down(number)
#     @speed -= number
#     puts "You decelerate to #{@speed} kph."
#   end

#   def current_speed
#     puts "You are now traveling at #{@speed} kph."
#   end


#   def spray_paint=(color)
#     self.color = color
#     puts "Your new #{color} paint job looks great."
#   end

#   def info
#     puts "your car's color is #{self.color}"
#   end

#   def self.total_number_of_vehicles
#     @@number_of_vehicles
#   end
# end

# class MyCar < Vehicle
#   include EasyCityParkAble
#   NUMBER_OF_DOORS = 2

# end

# class MyTruck < Vehicle
#   include OffRoadAble
#   SHARED_WITH = "Jonas"
#   NUMBER_OF_DOORS = 4
# end


# blue_chevy = MyCar.new(2007, "blue", "Lancer")
# red_toyota = MyTruck.new(2017, "red", "F150")

# class Student
#   attr_accessor :name

#   def initialize(n, g)
#     @name = n 
#     @grade = g 
#   end

#   def better_grade_than(other_student)
#     other_student.grade < grade
#   end

#   protected

#   def grade
#     @grade
#   end


# end

# joe = Student.new("Joe", 91)
# bob = Student.new("Bob", 92)

# p bob.better_grade_than(joe)



