class Player
  attr_accessor :hand, :participant
  
  def initialize(participant)
    @hand = []
    @participant = participant
  end

  def <<(arr, card)
    arr.push(card)
  end

  def total
    sum = 0
    hand.each do |card|
      if %w(2 3 4 5 6 7 8 9 10).include? card
        sum += card.to_i
      elsif %w(Jack Queen King).include? card
        sum += 10
      elsif card == "Ace" && sum < 11
        sum += 11
      else
        sum += 1
      end
    end
    sum
  end

  def capitalize
    participant.capitalize
  end

  def to_s
    participant
  end
end

class Dealer < Player
end

class User < Player
end

class Computer < Player
end

class Deck
  attr_accessor :deck
  
  def initialize
    @deck = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"] * 4
    @deck = @deck.shuffle
  end

  def pop
    @deck.pop
  end

  def to_s
    @deck.join(", ")
  end

end

class GameEngine
  PLAYER_COUNT = 4
  attr_accessor :deck, :player, :user, :dealer, :stay
  
  def initialize
    @deck = Deck.new
    @dealer = Dealer.new("dealer")
    @user = User.new("user")
    @player = "user"
    @stay = false
  end

  def display_welcome_message
    puts "Welcome to 21 OOP edition. "
  end

  def display_goodbye_message
    puts "Thanks for playing."
  end

  def line_break
    puts "================================="
  end

  def deal
    counter = 0
    loop do
      break if counter == PLAYER_COUNT
      deal_out_cards 
      counter += 1
    end
  end

  def deal_out_cards
    if @player == "user"
      user.hand << deck.pop
      @player = "dealer"
    elsif @player == "dealer"
      dealer.hand << deck.pop
      @player = "user"
    end
  end

  def join_or(arr, punctuation = ", ", word = "and")
    if arr.size > 1
    "#{arr.slice(0..-2).join(punctuation)} #{word} #{arr[-1]}"
    else 
      arr.first
    end
  end

  def display_all_hands(start = false)
    if start
      puts "User has #{join_or(user.hand)} for a total of #{user.total}."
      puts "Dealer has #{dealer.hand[0]} and a mystery card."
    else
      puts "User has #{join_or(user.hand)} for a total of #{user.total}."
      puts "Dealer has #{join_or(dealer.hand)} for a total of #{dealer.total}."
    end
  end
  
  def display_hand(participant)
    puts "#{participant.capitalize} has #{join_or(participant.hand)} for a total of #{participant.total}."
  end

  def user_turn
    answer = nil
    loop do
      puts "Do you want to hit (h) or stay (s)?"
      answer = gets.chomp.downcase
      @stay = true if answer == 's'
      break if %w(h s).include? answer
      puts "Invalid answer please enter h for hit or s for stay."
    end
    answer == 'h'
  end

  def hit(participant)
    card = deck.pop
    puts "#{participant.capitalize} hits!"
    puts "#{participant.capitalize} receives a #{card}."
    participant.hand << card
  end

  def checks_and_messages(participant, last_check = false)
    busted_message(participant) if busted?(participant)
    twenty_one_message(participant) if twenty_one?(participant)
    stay_message(user) if participant == user && @stay
    stay_message(dealer) if participant == dealer && dealer.total > 16 && !last_check
  end

  def busted_message(participant)
    puts "#{participant.capitalize} is over 21. #{participant.capitalize} is busted! #{participant.capitalize} loses!" if participant.total > 21
  end

  def twenty_one?(participant)
    participant.total == 21
  end

  def twenty_one_message(participant)
    puts "#{participant.capitalize} has cards totalling 21. #{participant.capitalize} wins!" if participant.total == 21
  end

  def stay?(participant)
    if participant == user && @stay
      return true
    elsif participant == dealer && dealer.total > 16
      return true
    end
  end

  def stay_message(participant)
    if @stay && participant == user
      puts "User stays at #{user.total}."
    elsif participant == dealer && dealer.total > 16
      puts "Dealer has more than 16. Dealer is forced to stay at #{dealer.total}."
    end
  end

  def busted?(participant)
    participant.total > 21
  end

  def early_result?(participant)
    busted?(participant) || twenty_one?(participant)
  end

  def dealer_reveals_cards
    puts "Dealer reveals their cards!!"
    puts "The dealers mystery card is a #{dealer.hand[1]}."
    puts "Dealer has #{join_or(dealer.hand)} for a total of #{dealer.total}."
  end

  def dealer_turn
    return nil if dealer.total > 16
    line_break
    puts "Its the dealers turn!"
    puts "Dealer hits until 17 then stays!"
    loop do
      break if dealer.total > 16 || busted?(dealer) || twenty_one?(dealer)
      sleep 3
      hit(dealer)
      display_hand(dealer)
      line_break
    end
    puts "Dealer stays" if !busted?(dealer) && !twenty_one?(dealer)
  end

  def display_result
    if user.total > dealer.total
      puts "User wins."
    elsif dealer.total > user.total
      puts "Dealer wins."
    else
      puts "Its a push."
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Care for another round? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Please enter y or n."
    end
    answer == "n"
  end

  def reset
    user.hand = []
    dealer.hand = []
  end


  def play
    display_welcome_message
    loop do
      loop do
        deal
        display_all_hands(start = true)
        loop do
          break if twenty_one?(user)
          hit(user) if user_turn
          display_hand(user)
          break if stay?(user) || busted?(user) || twenty_one?(user)
        end
        checks_and_messages(user)
        line_break
        break if early_result?(user)
        dealer_reveals_cards
        checks_and_messages(dealer)
        line_break
        dealer_turn 
        # busted_message(dealer)
        # twenty_one_message(dealer)
        checks_and_messages(dealer, last_check = true)
        break if early_result?(dealer)
        display_all_hands
        display_result
        break
      end
      reset
      break if play_again?
    end
    display_goodbye_message
  end

end

game = GameEngine.new
game.play

