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

#   def display_data
#     books.each do |book|
#       book.display_data
#     end
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

# community_library.display_data

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

#   def ==(other_loc)
#     latitude == other_loc.latitude &&
#     longitude == other_loc.longitude
#   end

#   def to_s
#     "(#{latitude}, #{longitude})"
#   end
# end

# # Example

# ada = Person.new('Ada')
# ada.location = GeoLocation.new(53.477, -2.236)

# grace = Person.new('Grace')
# grace.location = GeoLocation.new(-33.89, 151.277)

# ada.teleport_to(-33.89, 151.277)

# puts ada.location                   # (-33.89, 151.277)
# puts grace.location                 # (-33.89, 151.277)
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
#   #FORMAT = nil
  
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
#     if self > other
#       return 1
#     elsif self < other
#       return - 1
#     else
#       return 0
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

# Example

# puts [Length.new(1, :mi), Length.new(1, :nmi), Length.new(1, :km)].sort
# => comparison of Length with Length failed (ArgumentError)
# expected output:
# 1 km
# 1 mi
# 1 nmi

#7

# class BankAccount
#   attr_accessor :balance

#   def initialize(account_number, client)
#     @account_number = account_number
#     @client = client
#     @balance = 0
#   end

#   def deposit(amount)
#     if amount > 0
#       self.balance += amount
#       "$#{amount} deposited. Total balance is $#{balance}."
#     else
#       "Invalid. Enter a positive amount."
#     end
#   end

#   def withdraw(amount)
#     if balance - amount > 0
#       success = (self.balance -= amount)
#     else
#       success = false
#     end

#     if success
#       "$#{amount} withdrawn. Total balance is $#{balance}."
#     else
#       "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
#     end
#   end

#   def balance=(new_balance)
#     if valid_transaction?(new_balance)
#       @balance = new_balance
#       true
#     else
#       false
#     end
#   end

#   def valid_transaction?(new_balance)
#     new_balance >= 0
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
# p account.balance         # => 50

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
#     tasks = self.tasks.select do |task|
#       task.priority == :high
#     end

#     display(tasks)
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

#9

# class Mail
#   def to_s
#     "#{self.class}"
#   end
# end

# class Email < Mail
#   attr_accessor :subject, :body

#   def initialize(subject, body)
#     @subject = subject
#     @body = body
#   end
# end

# class Postcard < Mail
#   attr_reader :text

#   def initialize(text)
#     @text = text
#   end
# end

# module Mailing
#   def receive(mail, sender)
#     mailbox << mail unless reject?(sender)
#   end

#   # Change if there are sources you want to block.
#   def reject?(sender)
#     false
#   end

#   def send(destination, mail)
#     "Sending #{mail} from #{name} to: #{destination}"
#     # Omitting the actual sending.
#   end
# end

# class CommunicationsProvider
#   attr_reader :name, :account_number

#   def initialize(name, account_number=nil)
#     @name = name
#     @account_number = account_number
#   end
# end

# class EmailService < CommunicationsProvider
#   include Mailing

#   attr_accessor :email_address, :mailbox

#   def initialize(name, account_number, email_address)
#     super(name, account_number)
#     @email_address = email_address
#     @mailbox = []
#   end

#   def empty_inbox
#     self.mailbox = []
#   end
# end

# class TelephoneService < CommunicationsProvider
#   def initialize(name, account_number, phone_number)
#     super(name, account_number)
#     @phone_number = phone_number
#   end
# end

# class PostalService < CommunicationsProvider
#   include Mailing
  
#   attr_accessor :street_address, :mailbox

#   def initialize(name, street_address)
#     super(name)
#     @street_address = street_address
#     @mailbox = []
#   end

#   def change_address(new_address)
#     self.street_address = new_address
#   end
# end

# rafaels_email_account = EmailService.new('Rafael', 111, 'Rafael@example.com')
# johns_phone_service   = TelephoneService.new('John', 122, '555-232-1121')
# johns_postal_service  = PostalService.new('John', '47 Sunshine Ave.')
# ellens_postal_service = PostalService.new('Ellen', '860 Blackbird Ln.')

# puts johns_postal_service.send(ellens_postal_service.street_address, Postcard.new('Greetings from Silicon Valley!'))
# # => undefined method `860 Blackbird Ln.' for #<PostalService:0x00005571b4aaebe8> (NoMethodError)

# #10

# class AuthenticationError < Exception; end

# # A mock search engine
# # that returns a random number instead of an actual count.
# class SearchEngine
#   def self.count(query, api_key)
#     unless valid?(api_key)
#       raise AuthenticationError, 'API key is not valid.'
#     end
#     rand(200_000)
#   end

#   private

#   def self.valid?(key)
#     key == 'LS1A'
#   end
# end

# module DoesItRock
#   API_KEY = 'LS1A'

#   class NoScore; end

#   class Score
#     def self.for_term(term)
#       positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY).to_f
#       negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY).to_f

#       positive / (positive + negative)
#     rescue Exception
#       NoScore
#     end
#   end

#   def self.find_out(term)
#     score = Score.for_term(term)

#     if score == DoesItRock::NoScore
#       return "No idea about #{term}..."
#     elsif (0...0.5).include?(score)
#       return "#{term} is no fun."
#     elsif score == 0.5
#       return "#{term} seems to be ok..."
#     else 
#       return "#{term} rocks!"
#     end
#   rescue Exception => e
#     e.message
#   end
# end

# # Example (your output may differ)

# puts DoesItRock.find_out('Sushi')       # Sushi seems to be ok...
# puts DoesItRock.find_out('Rain')        # Rain is not fun.
# puts DoesItRock.find_out('Bug hunting') #

#Medium I

#1
# class Machine
#   def start
#     self.flip_switch(:on)
#   end

#   def stop
#     self.flip_switch(:off)
#   end

#   private 

#   attr_writer :switch

#   def flip_switch(desired_state)
#     self.switch = desired_state
#   end
# end

#2

# class IndexError ; end

# class FixedArray
#   attr_reader :arr

#   def initialize(arr)
#     @arr = Array.new(arr)
#   end

#   def [](element)
#     if (0...arr.size).include?(element) || (-(arr.size)..-1).include?(element)
#       arr[element]
#       else
#         raise IndexError
#       end
#   end

#   def []=(element, value)
#     if (0...arr.size).include?(element) || (-(arr.size)..-1).include?(element)
#     arr[element] = value
#     else
#       raise IndexError
#     end
#   end

#   def to_a
#     arr
#   end

#   def to_s
#     "#{arr}"
#   end
# end

# fixed_array = FixedArray.new(5)
# puts fixed_array[3] == nil
# puts fixed_array.to_a == [nil] * 5

# fixed_array[3] = 'a'
# puts fixed_array[3] == 'a'
# puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

# fixed_array[1] = 'b'
# puts fixed_array[1] == 'b'
# puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

# fixed_array[1] = 'c'
# puts fixed_array[1] == 'c'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

# fixed_array[4] = 'd'
# puts fixed_array[4] == 'd'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
# puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

# puts fixed_array[-1] == 'd'
# puts fixed_array[-4] == 'c'

# begin
#   fixed_array[6]
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[-7] = 3
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[7] = 3
#   puts false
# rescue IndexError
#   puts true
# end

#3

# class Student
#   def initialize(name, year)
#     @name = name
#     @year = year
#   end
# end

# class Graduate < Student
#   def initialize(name, year, parking)
#     super(name, year)
#     @parking = parking
#   end
# end

# class Undergraduate < Student
#   def initialize(name, year)
#     super
#   end
# end

#4

# class CircularQueue
#   attr_reader :circle_arr, :last_enqueued
#   attr_accessor :current_index, :order_array

#   def initialize(size)
#     @circle_arr = Array.new(size)
#     @current_index = 0
#     @order_array = []
#   end

#   def [](index)
#     @circle_arr.fetch(index)
#   end

#   def []=(index, value)
#     @circle_arr[index] = value
#   end

#   def empty?(index)
#     @circle_arr.fetch(index) == nil 
#   end

#   def arr_full?
#     @circle_arr.select { |element| element != nil }.size == @circle_arr.size
#   end

#   def arr_empty?
#     @circle_arr.select { |element| element != nil}.size == 0
#   end

#   def raise_current_index(index)
#     if index == circle_arr.size - 1
#       @current_index = 0
#     else
#       @current_index += 1
#     end
#   end

#   def enqueue(input)
#     if arr_full?
#       dequeue
#       @circle_arr[current_index] = input
#       @order_array.push([input, current_index])
#       raise_current_index(current_index)
#     else
#       loop do
#         if empty?(current_index)
#           @circle_arr[current_index] = input
#           @order_array.push([input, current_index])
#           raise_current_index(current_index)
#           break
#         else
#           raise_current_index(current_index)
#         end
#       end
#     end
#   end


#   def dequeue
#     if arr_empty?
#       return nil
#     else
#       last = order_array.first[0]
#       last_index = order_array.first[1]
#       @circle_arr[last_index] = nil
#       @order_array.delete_at(0)
#       return last
#     end 
#   end
# end


# # queue = CircularQueue.new(3)
# # puts queue.dequeue == nil

# # queue.enqueue(1)
# # queue.enqueue(2)
# # puts queue.dequeue == 1

# # queue.enqueue(3)
# # queue.enqueue(4)
# # puts queue.dequeue == 2

# # queue.enqueue(5)
# # queue.enqueue(6)
# # queue.enqueue(7)
# # puts queue.dequeue == 5
# # puts queue.dequeue == 6
# # puts queue.dequeue == 7
# # puts queue.dequeue == nil

# queue = CircularQueue.new(4)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 4
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil


#6/7

# class RandomNumber 
#   def initialize
#   end

#   def self.generate 
#     rand(100)
#   end
# end

# class User 
#   attr_accessor :answer, :low, :high, :number

#   def initialize
#     @answer = nil
#     @low = nil
#     @high = nil
#     @number = nil
#   end

#   def enter_low_range
#     loop do
#       puts "Enter a lower bound for the number guessing game."
#       self.low = gets.chomp.to_i
#       break
#     end
#   end
  
#   def enter_high_range
#     loop do
#       puts "Enter an upper bound for the number guessing game."
#       self.high = gets.chomp.to_i
#       break if high > low
#       puts "Upper bound must be greater than #{low}."
#     end
#   end

#   def set_number
#     self.number = (low..high).to_a.sample
#   end


#   def prompt 
#     loop do
#       puts "Please enter a number between #{low} and #{high}."
#       @answer = gets.chomp.to_i
#       break if (low..high).include? answer
#       puts "Invalid range."
#     end
#   end
# end


# class GuessingGame
#   attr_accessor :guesses, :user

#   def initialize
#     @user = User.new
#     @guesses = 7
#   end

#   def display_welcome_message
#     puts "Welcome to guess the number!"
#   end

#   def display_number_of_guesses
#     if guesses == 1
#       puts "This is your last guess!"
#     else
#       puts "You have #{guesses} guesses left."
#     end
#   end

#   def evaluate_answer
#     if user.answer == user.number
#       puts "Correct! You win!"
#     elsif user.answer > user.number 
#       puts "You're a bit high."
#     else 
#       puts "You're a bit low."
#     end
#   end

#   def correct_guess?
#     user.answer == user.number
#   end
  
#   def reduce_guesses
#     @guesses -= 1
#   end


#   def display_goodbye_message
#     puts "See ya later."
#   end

#   def play
#     display_welcome_message
#     user.enter_low_range
#     user.enter_high_range
#     user.set_number
#     loop do
#       display_number_of_guesses
#       user.prompt 
#       evaluate_answer
#       break if correct_guess?
#       reduce_guesses
#       break if guesses == 0
#     end
#     display_goodbye_message
#   end
# end

# game = GuessingGame.new
# game.play

#8/#9/#10

class Card
  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }
  include Comparable
  
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def <=>(other_card)
    value <=> other_card.value
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_reader :rank, :suit
  attr_accessor :deck

  def initialize
    @deck = make_deck.shuffle
  end

  def make_deck
    pack_of_cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        pack_of_cards.push(Card.new(rank, suit))
      end
    end
    pack_of_cards
  end

  def draw 
    reset if deck.size == 0
    deck.pop
  end

  def reset
    self.deck = make_deck.shuffle
  end

end


class PokerHand
  attr_reader :hand
  
  def initialize(hand)
    @hand = hand
  end

  def print§
    puts "You have a:"
    hand.each {puts card}
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
  end

  def straight_flush?
  end

  def four_of_a_kind?
  end

  def full_house?
  end

  def flush?
  end

  def straight?
  end

  def three_of_a_kind?
  end

  def two_pair?
  end

  def pair?
  end
end