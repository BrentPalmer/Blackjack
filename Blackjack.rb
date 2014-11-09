require 'pry'

def calculate_total(cards)
  arr = cards.map {|e| e[1]}

  total = 0
  arr.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end

arr.select{|e| e == "A"}.count.times do
  if total > 21
    total -= 10
  end
end
  total
end


def checks_for_blackjack(cards,user)
  if cards == 21
    puts "#{user} has Blackjack!"
    anounces_winner(players_total,dealers_total)
  else

  end
end


def anounces_winner(players_total,dealers_total)
  if players_total > dealers_total && players_total < 22
    puts "#{user_name} wins!"
  else
    puts "You lose!"
  end
end


def checks_busted(total)
  if total > 21
    puts "Sorry, you busted!"
    #figure out how to announce winner if player busts
    #announces_winner(players_total,dealers_total)
  else
  end
end


def checks_dealers_cards_is_greater_than_16(dealers_cards)
  if dealers_cards > 17
    anounces_winner(players_total,dealers_total)
  end
end





puts "Welcome to Blackjack!"
puts "Please enter you name: "
user_name = gets.chomp

puts "Welcome, #{user_name}!"

dealer_name = "dealer"
values = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
suits = ["Hearts", "Clubs", "Clovers", "Diamonds"]

deck = suits.product(values)
deck = deck.shuffle!

players_hand = []
dealers_hand = []

players_hand << deck.pop
dealers_hand << deck.pop
players_hand << deck.pop
dealers_hand << deck.pop

dealerscards = dealers_hand
playerscards = players_hand

dealers_total = calculate_total(dealerscards)
players_total = calculate_total(playerscards)

checks_for_blackjack(dealers_total,dealer_name)
checks_for_blackjack(players_total,user_name)



puts "Dealer has #{dealers_hand} for a total of: #{dealers_total}"
puts "#{user_name} cards are: #{players_hand} for a total of: #{players_total}"
puts "Would you like to: 1) HIT or 2) STAY?"
hit_or_stay = gets.chomp


#begin
if hit_or_stay.to_i == 1
  puts "#{user_name} hits!"
  players_hand << deck.pop
  puts "#{user_name}'s cards are: #{playerscards}"
  players_total = calculate_total(playerscards)
  puts "#{user_name}'s total: #{players_total}"
  checks_busted(players_total)
end
#end while #user presses 1 for hit!

if hit_or_stay.to_i == 2
  
  checks_dealers_cards_is_greater_than_16(dealers_total)


end











