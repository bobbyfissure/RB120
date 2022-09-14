#Classes and Objects I

#1

# puts "Hello".class 
# puts 5.class
# puts [1, 2, 3].class

#2

# module Walkable
#   def walk 
# #     "Let's go for a walk!"
# #   end
# # end

# # class Cat
# #   include Walkable
  
# #   def initialize(n)
# #     @name = n
# #   end

# #   def greet
# #     "Hello! My name is #{@name}!"
# #   end

# #   def name
# #     @name
# #   end

# #   def name=(name)
# #     @name = name
# #   end
# # end

# #3

# #Classes and Objects II

# # #1

# # class Cat
  
# #   def self.generic_greeting
# #     "Hello I'm a cat!"
# #   end
# # end



# # #2


# # class Cat
# #   attr_accessor :name

# #   def initialize(name)
# #     @name = name
# #   end

# #   def rename(name)
# #     self.name = name
# #   end

# # end

# # #3

# # class Cat
# #   attr_accessor :name

# #   def initialize(name)
# #     @name = name
# #   end

# #   def identify
# #     self
# #   end
# # end

# #4

# # class Cat
# #   attr_reader :name

# #   def self.generic_greeting
# #     puts "I'm a fat cat of Wallstreet."
# #   end

# #   def initialize(name)
# #     @name = name
# #   end

# #   def personal_greeting
# #     puts "Hello human! My name is #{name}. Will you pet me and make me a can of tuna?"
# #   end
# # end

# # kitty = Cat.new('Sophie')

# # Cat.generic_greeting
# # kitty.personal_greeting

# #5

# # class Cat
# #   @@number_o_cats = 0

# #   def initialize
# #     @@number_o_cats += 1
# #   end

# #   def self.total
# #    puts @@number_o_cats
# #   end
# # end


# # kitty1 = Cat.new
# # kitty2 = Cat.new

# # Cat.total

# #6

# class Cat
#   COLOR = "purple"

#   def initialize(n)
#     @name = n
#   end

#   def greet
#     puts "Hello my name is #{@name} and I'm #{COLOR}."
#   end
# end


# #7

# class Cat
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     "I'm #{@name}!"
#   end
# end

# #8
# # class Person
# #   attr_accessor :secret
# #   def initialize(secret)
# #     @secret = secret
# #   end 

# #   def secret
# #     @secret
# #   end

# #   def change_secret=(value)
# #     self.secret = value
# #   end
# # end

# # person1 = Person.new("I like turtles")
# # person1.change_secret = 'Shh.. this is a secret!'
# # puts person1.secret

# #9

# class Person
#   attr_writer :secret

#   def share_secret
#     puts @secret
#   end

#   private

#   attr_reader :secret
# end

# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'
# person1.share_secret

# #10

# class Person
#   attr_writer :secret

#   def compare_secret(other_secret)
#     other_secret == @secret
#   end

#   protected

#   attr_reader :secret
# end

# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'

# person2 = Person.new
# person2.secret = 'Shh.. this is a different secret!'

# puts person1.compare_secret(person2)

#OOP Basics: Inheritance

# #1


# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
# end

# class Car < Vehicle
# end

# truck1 = Truck.new(1994)
# truck1.year

# car1 = Car.new(2006)
# car1.year

# #2

# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
#   def start_engine
#     puts 'Ready to go!'
#   end

#   def initialize(year)
#     super
#     start_engine
#   end
# end

# truck1 = Truck.new(1994)
# truck1.year

# #3

# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
#   attr_reader :bed_type
#   def initialize(year, bed_type)
#     super(year)
#     @bed_type = bed_type
#   end
# end

# class Car < Vehicle
# end

# truck1 = Truck.new(1994, 'Short')
# truck1.year
# truck1.bed_type

#4

# class Vehicle
#   def start_engine
#     'Ready to go!'
#   end
# end

# class Truck < Vehicle
#   def start_engine(speed)
#     super() + " Drive #{speed} please!"
#   end
# end

# truck1 = Truck.new
# puts truck1.start_engine('fast')

#5

# module Towable
#   def tow
#     puts "I can tow a trailer"
#   end
# end

# class Truck
#   include Towable
# end

# class Car
# end

# truck1 = Truck.new
# truck1.tow

#6

# module Towable
#   def tow
#     'I can tow a trailer!'
#   end
# end

# class Vehicle
#   attr_accessor :year
#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
#   include Towable
# end

# class Car < Vehicle
# end

# truck1 = Truck.new(1994)
# puts truck1.year
# puts truck1.tow

# car1 = Car.new(2006)
# puts car1.year

#7


# class Animal
#   attr_reader :color

#   def initialize(color)
#     @color = color
#   end
# end

# class Cat < Animal
# end

# class Bird < Animal
# end

# cat1 = Cat.new('Black')
# cat1.color

# #Lookup path Cat < Animal

# #8

# #Cat < Animal < Object < Kernel < BasicObject

# #9

# #Bird < Flyable < Animal
# #First subclass THEN module THEN superclass.

# #10

# module Transportation
#   class Vehicle
#   end

#   class Truck < Vehicle
#   end

#   class Car < Vehicle
#   end
# end

# Transportation::Truck.new

#OOP Basics: Accessor Methods

#1

# class Person
#   attr_accessor :name
# end

# person1 = Person.new
# person1.name = 'Jessica'
# person1.name

# #2

# class Person
#   attr_accessor :name
#   attr_writer :phone_number
# end

# person1 = Person.new
# person1.name = 'Jessica'
# person1.phone_number = '0123456789'
# person1.name

#3

# class Person
#   attr_reader :phone_number

#   def initialize(number)
#     @phone_number = number
#   end
# end

# person1 = Person.new(1234567899)
# puts person1.phone_number

# person1.phone_number = 9987654321
# puts person1.phone_number

#4

# class Person
#   attr_accessor :first_name
#   attr_writer :last_name
#   def first_equals_last?
#     first_name == last_name
#   end

#   private

#   attr_reader :last_name
# end

# person1 = Person.new
# person1.first_name = 'Dave'
# person1.last_name = 'Smith'
# puts person1.first_equals_last?

#5

# class Person
#   attr_writer :age
  
#   def older_than?(other)
#     age > other.age
#   end

#   protected

#   attr_reader :age
# end

# person1 = Person.new
# person1.age = 17

# person2 = Person.new
# person2.age = 26

# puts person1.older_than?(person2)

#6

# class Person
#   attr_reader :name

#   def name=(name)
#     @name = name.capitalize
#   end
# end

# person1 = Person.new
# person1.name = 'eLiZaBeTh'
# puts person1.name

#7

# class Person
#   attr_writer :name

#   def name
#     "Mr. " + @name
#   end
# end

# person1 = Person.new
# person1.name = 'James'
# puts person1.name

#8

# class Person
#   #attr_reader :name --- we remove attr_reader since we are providing a custom getter method

#   def initialize(name)
#     @name = name
#   end

#   def name
#     @name.clone
#   end
# end

# person1 = Person.new('James')
# person1.name.reverse!
# puts person1.name

#9

# class Person

#   def age=(age)
#     @age = double(age)
#   end

#   def age
#     double(@age)
#   end

#   private

#   def double_age(value)
#     value * 2
#   end
# end

# person1 = Person.new
# person1.age = 20
# puts person1.age

#10

# class Person
#   attr_accessor :name

#   def name=(name)
#     parts = name.split
#     @first_name = parts.first
#     @last_name = parts.last ? parts.last : ""
#   end

#   def name
#     @name = "#{@first_name} #{@last_name}"
#   end
# end

# person1 = Person.new
# person1.name = 'John Doe'
# puts person1.name

#Easy I

#1

# class Banner
 
  
#   def initialize(message)
#     @message = message
#     puts @message
#   end


#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def horizontal_rule
#     "+" + "-" * (@message.size + 2) + "+"
#   end

#   def empty_line
#     "|" + " " * (@message.size + 2) + "|"
#   end

#   def message_line
#     "| #{@message} |"
#   end
# end

# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner

#2

# class Pet
#   attr_reader :name

#   def initialize(name)
#     @name = name.to_s
#   end

#   def to_s
#     #@name.upcase!
#     "My name is #{@name.upcase}."
#   end
# end

#3

# class Book
#   attr_reader :title, :author
#   def initialize(author, title)
#     @author = author
#     @title = title
#   end

#   def to_s
#     %("#{@title}", by #{@author})
#   end
# end

# book = Book.new("Neil Stephenson", "Snow Crash")
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)

#4

# class Book
#   attr_accessor :author, :title
#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new
# book.author = "Neil Stephenson"
# book.title = "Snow Crash"
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)

#5

# class Person
  
#   def initialize(first_name, last_name)
#     @first_name = first_name.capitalize
#     @last_name = last_name.capitalize
#   end

#   def first_name=(first_name)
#     @first_name = first_name.capitalize
#   end

#   def last_name=(last_name)
#     @last_name = last_name.capitalize
#   end

#   def to_s
#     "#{@first_name} #{@last_name}"
#   end
# end

# person = Person.new('john', 'doe')
# puts person

# person.first_name = 'jane'
# person.last_name = 'smith'
# puts person

#6 see site

#7

# class Car
#   attr_accessor :mileage

#   def initialize
#     @mileage = 0
#   end

#   def increment_mileage(miles)
#     @mileage = @mileage + miles
#   end

#   def print_mileage
#     puts @mileage
#   end
# end

# car = Car.new
# car.mileage = 5000
# car.increment_mileage(678)
# car.print_mileage  # should print 5678

#8

# class Rectangle
#   def initialize(height, width)
#     @height = height
#     @width = width
#   end

#   def area
#     @height * @width
#   end
# end

# class Square < Rectangle
#   def initialize(length_of_side)
#     super(length_of_side, length_of_side)
#   end
# end

# square = Square.new(5)
# puts "area of square = #{square.area}"

#9

# class Pet
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end

  
# end

# class Cat < Pet
#   def initialize(name, age, fur)
#     super(name, age)
#     @fur = fur
#   end

#   def to_s
#     "My cat #{@name.capitalize} is #{@age} years old and has #{@fur} fur."
#   end

# end

# pudding = Cat.new('Pudding', 7, 'black and white')
# butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
# puts pudding, butterscotch

#10

# class Vehicle
#   attr_reader :make, :model

#   def initialize(make, model)
#     @make = make
#     @model = model
#   end

#   def to_s
#     "#{make} #{model}"
#   end
# end

# class Car < Vehicle
  
#   def wheels
#     4
#   end
# end

# class Motorcycle < Vehicle

#   def wheels
#     2
#   end
# end

# class Truck < Vehicle
#   attr_reader :payload

#   def initialize(make, model, payload)
#     super(make, model)
#     @payload = payload
#   end

#   def wheels
#     6
#   end

# end

#Easy II

#1

# module Mailable
#   def print_address
#     puts "#{name}"
#     puts "#{address}"
#     puts "#{city}, #{state} #{zipcode}"
#   end
# end

# class Customer
#   attr_reader :name, :address, :city, :state, :zipcode
#   include Mailable
# end

# class Employee
#   attr_reader :name, :address, :city, :state, :zipcode
#   include Mailable
# end

# betty = Customer.new 
# bob = Employee.new
# betty.print_address
# bob.print_address

#2

# module Drivable
#   def drive
#   end
# end

# class Car
#   include Drivable
# end

# bobs_car = Car.new
# bobs_car.drive

#3

# class House
#   attr_reader :price

#   def initialize(price)
#     @price = price
#   end
# end

# home1 = House.new(100_000)
# home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1.price < home2.price
# puts "Home 2 is more expensive" if home2.price > home1.price

#4

# class Transform
#   def initialize(acro)
#     @acro = acro
#   end

#   def uppercase
#     @acro.upcase
#   end

#   def self.lowercase(letters)
#     letters.downcase
#   end
# end


# my_data = Transform.new('abc')
# puts my_data.uppercase #=> ABC
# puts Transform.lowercase('XYZ') #=> xyz

#5

# class Something
#   def initialize
#     @data = 'Hello'
#   end

#   def dupdata
#     @data + @data
#   end

#   def self.dupdata
#     'ByeBye'
#   end
# end

# thing = Something.new
# puts Something.dupdata
# puts thing.dupdata

#6

# class Wallet
 
#   include Comparable

#   def initialize(amount)
#     @amount = amount
#   end

#   def <=>(other_wallet)
#     amount <=> other_wallet.amount
#   end

#   protected

#   attr_reader :amount
# end

# bills_wallet = Wallet.new(500)
# pennys_wallet = Wallet.new(465)
# if bills_wallet > pennys_wallet
#   puts 'Bill has more money than Penny'
# elsif bills_wallet < pennys_wallet
#   puts 'Penny has more money than Bill'
# else
#   puts 'Bill and Penny have the same amount of money.'
# end

#7
#my solution

# class Pet
#   attr_reader :name, :type
#   def initialize(type, name)
#     @type = type
#     @name = name
#   end
# end

# class Owner
#   attr_reader :name
#   attr_accessor :number_of_pets
#   def initialize(name)
#     @name = name
#     @number_of_pets = 0
#   end
# end

# class Shelter
  
#   def initialize
#     @owners_pets = {}
#   end
  
#   def adopt(owner, pet)
#     @owners_pets[owner.name] ? @owners_pets[owner.name] << [pet.name, pet.type] : @owners_pets[owner.name] = [[pet.name, pet.type]]
#     owner.number_of_pets += 1
#   end

#   def print_adoptions
#     @owners_pets.each do |k, v|
#       puts "#{k} has adopted the following pets:"
#       "#{v.each {|pet| puts "a #{pet[1]} named #{pet[0]}"}}"
#       puts " "
#     end
# end
# end

# class Pet
#   attr_reader :animal, :name

#   def initialize(animal, name)
#     @animal = animal
#     @name = name
#   end

#   def to_s
#     "a #{animal} named #{name}"
#   end
# end

# class Owner
#   attr_reader :name, :pets
#   def initialize(name)
#     @name = name
#     @pets = []
#   end

#   def add_pet(pet)
#     pets << pet
#   end

#   def number_of_pets
#     pets.size
#   end

#   def print_pets
#     puts pets
#   end
# end

# class Shelter
#   def initialize
#     @owners = {}
#   end

#   def adopt(owner, pet)
#     owner.add_pet(pet)
#     @owners[owner.name] ||= owner 
#   end

#   def print_adoptions
#     @owners.each_pair do |name, owner|
#       puts "#{name} has adopted the following pets:"
#       owner.print_pets
#       puts
#     end
#   end
# end


# butterscotch = Pet.new('cat', 'Butterscotch')
# pudding      = Pet.new('cat', 'Pudding')
# darwin       = Pet.new('bearded dragon', 'Darwin')
# kennedy      = Pet.new('dog', 'Kennedy')
# sweetie      = Pet.new('parakeet', 'Sweetie Pie')
# molly        = Pet.new('dog', 'Molly')
# chester      = Pet.new('fish', 'Chester')
# toppie = Pet.new("cat", 'Toppie')
# nova = Pet.new("cat", "Nova")

# phanson = Owner.new('P Hanson')
# bholmes = Owner.new('B Holmes')
# zkorner = Owner.new("Z Korner")

# shelter = Shelter.new
# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.adopt(zkorner, toppie)
# shelter.adopt(zkorner, nova)
# shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

#8

module Walkable
  def walk
   puts "#{self} #{gait} forward"
  end
end

# class Person
#   include Walkable
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "strolls"
#   end
# end

# class Cat
#   include Walkable
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "saunters"
#   end
# end

# class Cheetah
#   include Walkable
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "runs"
#   end
# end


# mike = Person.new("Mike")
# mike.walk
# # => "Mike strolls forward"

# kitty = Cat.new("Kitty")
# kitty.walk
# # => "Kitty saunters forward"

# flash = Cheetah.new("Flash")
# flash.walk
# # => "Flash runs forward"

#9

# class Noble
#   include Walkable
#   attr_reader :name, :title

#   def initialize(name, title)
#     @name = name
#     @title = title
#   end

#   def to_s
#     "#{name} #{title}"
#   end

#   private

#   def gait
#     "struts"
#   end
# end


# byron = Noble.new("Byron", "Lord")
# byron.walk

# class Cat
#   include Walkable
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     name
#   end

#   private

#   def gait
#     "runs"
#   end
# end

# kitty = Cat.new("Kitty")
# kitty.walk
# # => "Kitty saunters forward"