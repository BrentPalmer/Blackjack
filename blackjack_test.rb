require 'pry'


def conversion_of_numstring_to_facecards(cards)
  arr = cards.map {|e| e[1]}

  converted_card = []
  arr.each do |value|
    if value.to_i == 11
      converted_card = "J"
    elsif value.to_i == 12
      converted_card = "Q"
    elsif value.to_i == 13
      converted_card = "K"
    elsif value.to_i == 14
      converted_card = "A"
    else
      converted_card = value.to_i
    end
  end
  converted_card
end

def conversion_of_facecards_back_to_numstring(cards)

end



puts "Welcome to Blackjack!"
puts "Please enter you name: "
user_name = gets.chomp

puts "Welcome, #{user_name}!"

values = ["2","3","4","5","6","7","8","9","10","11","12","13","14"]
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

puts "Dealer has: #{dealerscards}"
puts "#{user_name} has: #{playerscards}"



playerscards << conversion_of_numstring_to_facecards(playerscards)
dealerscards << conversion_of_numstring_to_facecards(dealerscards)

puts "#{dealerscards}"
puts "#{playerscards}"

#dealers_total = calculate_total(dealerscards)
#players_total = calculate_total(playerscards)












