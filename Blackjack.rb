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
  end
end


def anounces_winner(players_total,dealers_total,user_name)
  if players_total > dealers_total && players_total < 22
    puts "#{user_name} wins!"
  elsif dealers_total > 21
    puts "#{user_name} wins!"
  elsif players_total == dealers_total
    puts "It is a tie!"
  else
    puts "Dealer wins!"
  end
end


def checks_user_busted(total)
  if total > 21
    puts "Sorry, you busted!"
  end
end


def checks_dealer_busted(total)
  if total > 21
    puts "Dealer busted!"
  end
end



  
puts "Welcome to Blackjack!"
puts "Please enter you name: "
user_name = gets.chomp
puts ""

begin
  puts ""
  puts "Welcome, #{user_name}!"
  puts ""

  dealer_name = "Dealer"
  values = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
  suits = ["Hearts", "Clubs", "Spades", "Diamonds"]

  deck = suits.product(values)
  deck = deck.shuffle!

  players_hand = []
  dealers_hand = []

  2.times do
    players_hand << deck.pop
    dealers_hand << deck.pop
  end

  dealerscards = dealers_hand
  playerscards = players_hand

  dealers_total = calculate_total(dealerscards)
  players_total = calculate_total(playerscards)

  puts "Dealer has #{dealers_hand} for a total of: #{dealers_total}"
  puts "#{user_name}'s' cards are: #{players_hand} for a total of: #{players_total}"

  checks_for_blackjack(dealers_total,dealer_name)
  checks_for_blackjack(players_total,user_name)

  if players_total != 21

    begin
      puts ""
      puts "Would you like to: 1) 'HIT' or 2) 'STAY' (Enter in the numerical #1 or #2)?"
      hit_or_stay = gets.chomp

      if hit_or_stay.to_i == 1
        puts ""
        puts "#{user_name} hits!"
        players_hand << deck.pop
        puts "#{user_name}'s cards are: #{playerscards}"
        players_total = calculate_total(playerscards)
        puts "=> #{user_name}'s total: #{players_total}"
        checks_user_busted(players_total)

          if players_total > 21 || players_total == 21
            hit_or_stay = 0
          end

      elsif hit_or_stay.to_i == 2
          hit_or_stay = 0
      end
    end until hit_or_stay == 0
  end
    
    if players_total > 21
    else

      begin
        ending = 0
        if dealers_total < 17
          puts ""
          puts "Dealer hits!"
          dealers_hand << deck.pop
          puts "Dealer's cards are: #{dealerscards}"
          dealers_total = calculate_total(dealerscards)
          puts "=> Dealer's total: #{dealers_total}"
          checks_dealer_busted(dealers_total)
        end

        if dealers_total > 21
          ending = 1
        end

        if dealers_total >= 17 && dealers_total < 22
          ending = 1
        end
      end until ending == 1
    end


    puts ""
    anounces_winner(players_total,dealers_total,user_name)

    puts ""
    puts "Would you like to play again? (Y/N)"
    play_again = gets.chomp.upcase!
end until play_again != "Y"

