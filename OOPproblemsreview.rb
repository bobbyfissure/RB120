#Important questions

#Inheritance 9


#OO Basics Classes and Objects I

#1

# puts "Hello".class
# puts 5.class
# puts [1, 2, 3].class

#2

# class Cat
# end

# class Cat; end

#3/4

# class Cat
  
#   def initialize(name)
#     @name = name
#     puts "Hello my name is #{@name} and I'm a cat!"
#   end
# end

# kitty = Cat.new("Sophie")

#5/6/7

# class Cat
#   attr_reader :name
  
#   def initialize(name)
#     @name = name
#   end

#   def name=(n)
#     @name = n 
#   end
# end

# kitty = Cat.new("Sophie")
# kitty.name = "Charles"
# puts kitty.name

#10

# module Walkable
#   def walk
#     puts "Lets take #{self.class} for a walk!"
#   end
# end

# class Cat
#   include Walkable
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def greet
#     puts "Hello! My name is #{name}!"
#   end
# end

# kitty = Cat.new('Sophie')
# kitty.greet
# kitty.walk

#OOP Basics: Classes and Objects II

#1

# class Cat
#   def self.generic_greeting
#     puts "Hello I am a cat."
#   end
# end

# Cat.generic_greeting

#2


# class Cat
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def rename(name)
#     self.name = name
#   end
# end

# kitty = Cat.new('Sophie')
# kitty.name
# kitty.rename('Chloe')
# puts kitty.name

#3

# class Cat
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def identify
#     self.inspect
#   end
# end

# kitty = Cat.new('Sophie')
# puts kitty.identify

#4

# class Cat
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def self.generic_greeting
#     puts "I'm a cat."
#   end

#   def personal_greeting
#     puts "Hi I'm #{name} and I'm a #{self.class}."
#   end
# end

# kitty = Cat.new('Sophie')

# Cat.generic_greeting
# kitty.personal_greeting

#5

# class Cat
#   @@total_cats = 0

#   def initialize
#     @@total_cats += 1
#   end

#   def self.total 
#     puts @@total_cats
#   end
# end

# kitty1 = Cat.new
# kitty2 = Cat.new

# Cat.total

#6

# class Cat
#   COLOR = "purple"

#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def greet
#     puts "Hello I'm #{@name} and I am a #{COLOR} cat."
#   end
# end


# kitty = Cat.new('Sophie')
# kitty.greet

#7

# class Cat
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     "I'm #{name}."
#   end
# end

# kitty = Cat.new('Sophie')
# puts kitty

#8

# class Person
#   attr_accessor :secret
# end

# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'
# puts person1.secret

#9

# class Person
#   attr_writer :secret

#   def share_secret
#     puts secret
#   end

#   private

#   attr_reader :secret
# end

# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'
# person1.share_secret

#10

# class Person
#   attr_writer :secret

#   def compare_secret(other_person)
#     secret == other_person.secret
#   end

#   protected

#   attr_reader :secret
# end

# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'

# person2 = Person.new
# person2.secret = 'Shh.. this is a different secret!'

# puts person1.compare_secret(person2)


#Inheritance

#1


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
# puts truck1.year

# car1 = Car.new(2006)
# puts car1.year

#2

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
# puts truck1.year

#3


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
# puts truck1.year
# puts truck1.bed_type

#4

# class Vehicle
#   def start_engine
#     'Ready to go!'
#   end
# end

# class Truck < Vehicle
#   def start_engine(speed)
#     super() + " Drive #{speed} please."
#   end
# end

# truck1 = Truck.new
# puts truck1.start_engine('fast')

#5

# module Towable
#   def tow
#     puts "I can tow"
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
#   attr_reader :year
  
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
# attr_reader :color

# def initialize(color)
#   @color = color
# end
# end

# class Cat < Animal
# end

# class Bird < Animal
# end

# cat1 = Cat.new('Black')
# cat1.color

# # Cat < Animal

#8


# class Animal
# end

# class Cat < Animal
# end

# class Bird < Animal
# end

# cat1 = Cat.new
# puts cat1.color.ancestors

#Cat < Animal < Object < Kernel < BasicObject

#9

#Bird < Flyable < Animal

#10

# module Transportation

#   class Vehicle
#   end

#   class Truck < Vehicle; end

#   class Car < Vehicle ; end
# end

#OOP: Accessor Methods

#1

# class Person
#   attr_accessor :name
# end

# person1 = Person.new
# person1.name = 'Jessica'
# puts person1.name

#2


# class Person
#   attr_accessor :name
#   attr_writer :phone_number
# end

# person1 = Person.new
# person1.name = 'Jessica'
# person1.phone_number = '0123456789'
# puts person1.name

#3

# class Person
#   attr_reader :phone_number

#   def initialize(number)
#     @phone_number = number
#   end

#   private

#   attr_writer :phone_number
# end

# person1 = Person.new(1234567899)
# puts person1.phone_number

# person1.phone_number = 9987654321
# puts person1.phone_number

#4


# class Person
#   attr_writer :last_name
#   attr_accessor :first_name
  
#   def first_equals_last?
#     first_name == last_name
#   end

#   protected

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

#   end

# person1 = Person.new
# person1.name = 'eLiZaBeTh'
# puts person1.name

#7


# class Person
#   attr_writer :name
  
#   def name
#     "Mr. #{@name}"
#   end
# end

# person1 = Person.new
# person1.name = 'James'
# puts person1.name

#8

# class Person

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
#   def age
#     double(@age)
#   end

#   def age=(number)
#     @age = double(number)
#   end

#   private

#   def double(num)
#     num * 2
#   end
# end

# person1 = Person.new
# person1.age = 20
# puts person1.age

#10


# class Person

#   def name
#     "#{@first_name} #{@last_name}"
#   end

#   def name=(name)
#     @first_name, @last_name = name.split
# end

# person1 = Person.new
# person1.name = 'John Doe'
# puts person1.name

#Easy I

#1
# class Banner
  

#   def initialize(message)
#     @message = message
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def message_size(message)
#     @message.size + 2
#   end

#   def horizontal_rule
#     "+" + "-" * message_size(@message) + "+"
#   end

#   def empty_line
#     "|" + " " * message_size(@message) + "|"
#   end

#   def message_line
#     "| #{@message} |"
#   end
# end

# banner1 = Banner.new('To boldly go where no one has gone before.')
# puts banner1

#2

# class Pet
#   attr_reader :name

#   def initialize(name)
#     @name = name.to_s
#   end

#   def to_s
#     "My name is #{@name.upcase}."
#   end
# end

# name = 42
# fluffy = Pet.new(name)
# name += 1
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

#3

# class Book
#   attr_reader :title, :author

#   def initialize(author, title)
#     @author = author
#     @title = title
#   end

#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new("Neil Stephenson", "Snow Crash")
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)

#4


# class Book
#   attr_accessor :title, :author
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
#   attr_writer :first_name, :last_name
  
#   def initialize(first_name, last_name)
#     @first_name = first_name.capitalize
#     @last_name = last_name.capitalize
#   end

#   def to_s
#     "#{@first_name.capitalize} #{@last_name.capitalize}"
#   end
# end

# person = Person.new('john', 'doe')
# puts person

# person.first_name = 'jane'
# person.last_name = 'smith'
# puts person

#6

# class Flight
#   #attr_accessor :database_handle

#   def initialize(flight_number)
#     @database_handle = Database.init
#     @flight_number = flight_number
#   end
# end

#7

# class Car
#   attr_accessor :mileage

#   def initialize
#     @mileage = 0
#   end

#   def increment_mileage(miles)
#     total = mileage + miles
#     self.mileage = total
#   end

#   def print_mileage
#     puts mileage
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
#   def initialize(side)
#     super(side, side)
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
  
#   def initialize(name, age, color)
#     super(name, age)
#     @color = color
#   end

#   def to_s
#     "My cats name is #{@name} and their coat is #{@color}."
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
#   attr_reader  :payload

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
#   include Mailable
#   attr_reader :name, :address, :city, :state, :zipcode
# end

# class Employee
#   include Mailable
#   attr_reader :name, :address, :city, :state, :zipcode
# end

# betty = Customer.new 
# bob = Employee.new
# betty.print_address
# bob.print_address

#2

# module Drivable
#   def drive
#     puts "I'm driving"
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
#   include Comparable

#   def initialize(price)
#     @price = price
#   end

#   def <=>(other_home)
#     price <=> other_home.price
#   end
# end

# home1 = House.new(100_000)
# home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1 < home2
# puts "Home 2 is more expensive" if home2 > home1

#4
# class Transform
#   def initialize(letters)
#     @letters = letters
#   end

#   def uppercase
#     @letters.upcase
#   end

#   def self.lowercase(acro)
#     acro.downcase
#   end

# end

# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')

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

# class Pet
#   attr_reader :name, :species
  
#   def initialize(species, name)
#     @species = species
#     @name = name
#   end
# end

# class Owner
#   attr_accessor :pets
#   attr_reader :name
  
#   def initialize(name)
#     @name = name
#     @pets = []
#   end

#   def number_of_pets
#     pets.size
#   end
# end

# class Shelter
#   attr_reader :adoptions

#   def initialize
#     @adoptions = {}
#   end
  
#   def adopt(owner, pet)
#     owner.pets.push(pet)
#     adoptions[owner.name] ? adoptions[owner.name].push(pet) : adoptions[owner.name] = [pet]
#   end

#   def print_adoptions
#     adoptions.each do |k, v|
#       puts "#{k} has adopted the following pets: "
#       adoptions[k].each do |pet|
#         puts "a #{pet.species} named #{pet.name}"
#       end
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


# phanson = Owner.new('P Hanson')
# bholmes = Owner.new('B Holmes')

# shelter = Shelter.new
# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)

# # p shelter.adoptions
# shelter.print_adoptions
# # puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# # puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

#8

# module Walkable
#   def walk
#     puts "#{name} #{gait} forward "
#   end
# end


# class Person
#   attr_reader :name

#   include Walkable

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "strolls"
#   end
# end

# class Cat
#   attr_reader :name

#   include Walkable

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "saunters"
#   end
# end

# class Cheetah
#   attr_reader :name

#   include Walkable

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

# module Walkable
#   def walk
#     puts "#{name} #{gait} forward "
#   end
# end

# class Noble
#   include Walkable

#   attr_reader :name, :title

#   def initialize(name, title)
#     @name = name
#     @title = title
#   end

#   private 

#   def gait
#     "struts"
#   end
# end


# byron = Noble.new("Byron", "Lord")
# byron.walk
# # => "Lord Byron struts forward"

# puts byron.name

# puts byron.title

#Debugging

#1

# class Library
#   attr_accessor :address, :phone, :books

#   def initialize(address, phone)
#     @address = address
#     @phone = phone
#     @books = []
#   end

#   def check_in(book)
#     books.push(book)
#   end
# end

# class Book
#   attr_accessor :title, :author, :isbn

#   def initialize(title, author, isbn)
#     @title = title
#     @author = author
#     @isbn = isbn
#   end

#   def display_data
#     puts "---------------"
#     puts "Title: #{title}"
#     puts "Author: #{author}"
#     puts "ISBN: #{isbn}"
#     puts "---------------"
#   end
# end

# community_library = Library.new('123 Main St.', '555-232-5652')
# learn_to_program = Book.new('Learn to Program', 'Chris Pine', '978-1934356364')
# little_women = Book.new('Little Women', 'Louisa May Alcott', '978-1420951080')
# wrinkle_in_time = Book.new('A Wrinkle in Time', 'Madeleine L\'Engle', '978-0312367541')

# community_library.check_in(learn_to_program)
# community_library.check_in(little_women)
# community_library.check_in(wrinkle_in_time)

# community_library.books.each {|book| book.display_data}

#2

# class Animal
#   def initialize(diet, superpower)
#     @diet = diet
#     @superpower = superpower
#   end

#   def move
#     puts "I'm moving!"
#   end

#   def superpower
#     puts "I can #{@superpower}!"
#   end
# end

# class Fish < Animal
#   def move
#     puts "I'm swimming!"
#   end
# end

# class Bird < Animal
# end

# class FlightlessBird < Bird
#   def initialize(diet, superpower)
#     super
#   end

#   def move
#     puts "I'm running!"
#   end
# end

# class SongBird < Bird
#   def initialize(diet, superpower, song)
#     super(diet, superpower)
#     @song = song
#   end

#   def move
#     puts "I'm flying!"
#   end
# end

# # Examples

# unicornfish = Fish.new(:herbivore, 'breathe underwater')
# penguin = FlightlessBird.new(:carnivore, 'drink sea water')
# robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')

#3

# class Person
#   attr_reader :name
#   attr_accessor :location

#   def initialize(name)
#     @name = name
#   end

#   def teleport_to(latitude, longitude)
#     @location = GeoLocation.new(latitude, longitude)
#   end

# end

# class GeoLocation
#   attr_reader :latitude, :longitude

#   def initialize(latitude, longitude)
#     @latitude = latitude
#     @longitude = longitude
#   end

#   def to_s
#     "(#{latitude}, #{longitude})"
#   end


#   def ==(other)
#     latitude == other.latitude && longitude == other.longitude
#   end
# end

# # Example

# ada = Person.new('Ada')
# ada.location = GeoLocation.new(53.477, -2.236)

# grace = Person.new('Grace')
# grace.location = GeoLocation.new(-33.89, 151.277)

# ada.teleport_to(-33.89, 151.277)

# puts ada.location         # (-33.89, 151.277)
# puts grace.location                # (-33.89, 151.277)
# puts ada.location == grace.location # expected: true
#                                     # actual: false

#4

# class EmployeeManagementSystem
#   attr_reader :employer

#   def initialize(employer)
#     @employer = employer
#     @employees = []
#   end

#   def add(employee)
#     if exists?(employee)
#       puts "Employee serial number is already in the system."
#     else
#       employees.push(employee)
#       puts "Employee added."
#     end
#   end

#   alias_method :<<, :add

#   def remove(employee)
#     if !exists?(employee)
#       puts "Employee serial number is not in the system."
#     else
#       employees.delete(employee)
#       puts "Employee deleted."
#     end
#   end

#   def exists?(employee)
#     employees.any? { |e| e == employee }
#   end

#   def display_all_employees
#     puts "#{employer} Employees: "

#     employees.each do |employee|
#       puts ""
#       puts employee.to_s
#     end
#   end

#   private

#   attr_accessor :employees
# end

# class Employee
#   attr_reader :name

#   def initialize(name, serial_number)
#     @name = name
#     @serial_number = serial_number
#   end

#   def ==(other)
#     serial_number == other.serial_number
#   end

#   def to_s
#     "Name: #{name}\n" +
#     "Serial No: #{abbreviated_serial_number}"
#   end

#   protected

#   attr_reader :serial_number

#   private

#   def abbreviated_serial_number
#     serial_number[-4..-1]
#   end
# end

# # Example

# miller_contracting = EmployeeManagementSystem.new('Miller Contracting')

# becca = Employee.new('Becca', '232-4437-1932')
# raul = Employee.new('Raul', '399-1007-4242')
# natasha = Employee.new('Natasha', '399-1007-4242')

# miller_contracting << becca     # => Employee added.
# miller_contracting << raul      # => Employee added.
# miller_contracting << raul      # => Employee serial number is already in the system.
# miller_contracting << natasha   # => Employee serial number is already in the system.
# miller_contracting.remove(raul) # => Employee deleted.
# miller_contracting.add(natasha) # => Employee added.

# miller_contracting.display_all_employees

#5

# class File
#   attr_accessor :name, :byte_content

#   def initialize(name)
#     @name = name
#   end

#   alias_method :read,  :byte_content
#   alias_method :write, :byte_content=

#   def copy(target_file_name)
#     target_file = self.class.new(target_file_name)
#     target_file.write(read)

#     target_file
#   end

#   def to_s
#     "#{name}.#{self.class::FORMAT}"
#   end
# end

# class MarkdownFile < File
#   FORMAT = :md
# end

# class VectorGraphicsFile < File
#   FORMAT = :svg
# end

# class MP3File < File
#   FORMAT = :mp3
# end

# # Test

# blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
# blog_post.write('Content will be added soon!'.bytes)

# copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

# puts copy_of_blog_post.is_a? MarkdownFile     # true
# puts copy_of_blog_post.read == blog_post.read # true

# puts blog_post

#6

# class Length
#   attr_reader :value, :unit

#   def initialize(value, unit)
#     @value = value
#     @unit = unit
#   end

#   def as_kilometers
#     convert_to(:km, { km: 1, mi: 0.6213711, nmi: 0.539957 })
#   end

#   def as_miles
#     convert_to(:mi, { km: 1.609344, mi: 1, nmi: 0.8689762419 })
#   end

#   def as_nautical_miles
#     convert_to(:nmi, { km: 1.8519993, mi: 1.15078, nmi: 1 })
#   end

#   def ==(other)
#     case unit
#     when :km  then value == other.as_kilometers.value
#     when :mi  then value == other.as_miles.value
#     when :nmi then value == other.as_nautical_miles.value
#     end
#   end

#   def <(other)
#     case unit
#     when :km  then value < other.as_kilometers.value
#     when :mi  then value < other.as_miles.value
#     when :nmi then value < other.as_nautical_miles.value
#     end
#   end

#   def <=(other)
#     self < other || self == other
#   end

#   def >(other)
#     !(self <= other)
#   end

#   def >=(other)
#     self > other || self == other
#   end

#   def <=>(other)
#     case unit
#     when :km  then value <=> other.as_kilometers.value
#     when :mi  then value <=> other.as_miles.value
#     when :nmi then value <=> other.as_nautical_miles.value
#     end
#   end

#   def to_s
#     "#{value} #{unit}"
#   end

#   private

#   def convert_to(target_unit, conversion_factors)
#     Length.new((value / conversion_factors[unit]).round(4), target_unit)
#   end
# end

# # Example

# puts [Length.new(1, :mi), Length.new(1, :nmi), Length.new(1, :km)].sort
# # => comparison of Length with Length failed (ArgumentError)
# # expected output:
# # 1 km
# # 1 mi
# # 1 nmi

#7

# class BankAccount
#   attr_reader :balance

#   def initialize(account_number, client)
#     @account_number = account_number
#     @client = client
#     @balance = 0
#   end

#   def deposit(amount)
#     if amount > 0
#       @balance += amount
#       "$#{amount} deposited. Total balance is $#{balance}."
#     else
#       "Invalid. Enter a positive amount."
#     end
#   end

#   def withdraw(amount)
#     if amount > 0
#       success = valid_transaction?(amount)
#     else
#       success = false
#     end

#     if success
#       "$#{amount} withdrawn. Total balance is $#{balance}."
#     else

#       "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
#     end
#   end

#   def balance=(amount)
#     if valid_transaction?(amount)
#       @balance = balance - amount
#       true
#     else
#       false
#     end
#   end

#   def valid_transaction?(amount)
#     @balance - amount >= 0
#   end
# end

# # Example

# account = BankAccount.new('5538898', 'Genevieve')

#                           # Expected output:
# p account.balance         # => 0
# p account.deposit(50)     # => $50 deposited. Total balance is $50.
# p account.balance         # => 50
# p account.withdraw(80)    # => Invalid. Enter positive amount less than or equal to current balance ($50).
#                           # Actual output: $80 withdrawn. Total balance is $50.
# p account.balance

#8

# class TaskManager
#   attr_reader :owner
#   attr_accessor :tasks

#   def initialize(owner)
#     @owner = owner
#     @tasks = []
#   end

#   def add_task(name, priority=:normal)
#     task = Task.new(name, priority)
#     tasks.push(task)
#   end

#   def complete_task(task_name)
#     completed_task = nil

#     tasks.each do |task|
#       completed_task = task if task.name == task_name
#     end

#     if completed_task
#       tasks.delete(completed_task)
#       puts "Task '#{completed_task.name}' complete! Removed from list."
#     else
#       puts "Task not found."
#     end
#   end

#   def display_all_tasks
#     display(tasks)
#   end

#   def display_high_priority_tasks
#     high_prio_tasks = tasks.select do |task|
#       task.priority == :high
#     end

#     display(high_prio_tasks)
#   end

#   private

#   def display(tasks)
#     puts "--------"
#     tasks.each do |task|
#       puts task
#     end
#     puts "--------"
#   end
# end

# class Task
#   attr_accessor :name, :priority

#   def initialize(name, priority=:normal)
#     @name = name
#     @priority = priority
#   end

#   def to_s
#     "[" + sprintf("%-6s", priority) + "] #{name}"
#   end
# end

# valentinas_tasks = TaskManager.new('Valentina')

# valentinas_tasks.add_task('pay bills', :high)
# valentinas_tasks.add_task('read OOP book')
# valentinas_tasks.add_task('practice Ruby')
# valentinas_tasks.add_task('run 5k', :low)

# valentinas_tasks.complete_task('read OOP book')

# valentinas_tasks.display_all_tasks
# valentinas_tasks.display_high_priority_tasks

#Medium

#1


class Machine
  

  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  private

  attr_writer :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

