#Easy I

#1

#Everything in Ruby is an object.

#Use the .class method (i.e. X.class) to return the class/object of an object.

#2


# module Speed
#   def go_fast
#     puts "I am a #{self.class} and going super fast!"
#   end
# end

# class Car
#   include Speed
#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end

# class Truck
#   include Speed
#   def go_very_slow
#     puts "I am a heavy truck and like going very slow."
#   end
# end

# Car.new.go_fast
# Truck.new.go_fast

#3

#The key is self.class

#1 self refers to the object itself
#2 .class returns the class of the object

#4


# class AngryCat
#   def hiss
#     puts "Hisssss!!!"
#   end
# end

# nova = AngryCat.new


#5

# class Fruit
#   def initialize(name)
#     name = name
#   end
# end

# class Pizza
#   def initialize(name)
#     @name = name
#   end
# end

# pear = Fruit.new("pear")
# domino = Pizza.new("domino")

# p domino.instance_variables
# p pear.instance_variables


#6


# class Cube
  
#   def initialize(volume)
#     @volume = volume
#   end

#   def volume
#     @volume
#   end
# end

# rubik = Cube.new(51)
# p rubik.volume

#7

#Easy II

#Written out in my notebook

#Easy III

#6
# class Cat
#   attr_accessor :type, :age

#   def initialize(type)
#     @type = type
#     @age  = 0
#   end

#   def make_one_year_older
#     @age += 1
#   end
# end

# toppy = Cat.new("black and white")
# toppy.make_one_year_older
# toppy.make_one_year_older
# p toppy.age

#7

#Medium I

#4

# class Greeting 
#   def greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   def hi 
#      greet("hello")
#   end
# end

# class Goodbye < Greeting
#   def bye 
#     greet("goodbye")
#   end
# end

# hello = Hello.new
# goodbye = Goodbye.new

# hello.hi
# goodbye.bye

#5


# class KrispyKreme
#   attr_reader :filling_type, :glazing
  
#   def initialize(filling_type, glazing)
#     @filling_type = filling_type
#     @glazing = glazing
#   end

#   def to_s
#     if filling_type == nil && glazing == nil
#       "Plain"
#     elsif filling_type && glazing == nil
#       "#{filling_type}"
#     elsif filling_type == nil && glazing
#       "Plain with #{glazing}"
#     else
#       "#{filling_type} with #{glazing}"
#     end
#   end

# end

# donut1 = KrispyKreme.new(nil, nil)
# donut2 = KrispyKreme.new("Vanilla", nil)
# donut3 = KrispyKreme.new(nil, "sugar")
# donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
# donut5 = KrispyKreme.new("Custard", "icing")

# puts donut1

# puts donut2

# puts donut3

# puts donut4

# puts donut5 

#Hard

#1

module FuelEfficiency 
  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include FuelEfficiency
  attr_accessor :speed, :heading

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end

  
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

class Catamaran
  include FuelEfficiency
  attr_reader :propeller_count, :hull_count
  attr_accessor :speed, :heading

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    # ... code omitted ...
  end
end
