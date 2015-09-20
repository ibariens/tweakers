max_amount_cents = (4*2 + 1*1) * 100
total_uniques = []

def unique_amount_possible?(unique_amount)
  coins_hash = {200 => 4, 100 => 2, 50 => 8, 20 => 1, 10 => 4, 5 => 3}
  coins_available =  coins_hash.dup
  remaining_amount = unique_amount


  for i in 1..5
    coins_hash.each do |coin, coins_left|
       if (coins_available[coin] > 0) && (remaining_amount >= coin)
         coins_available[coin] = coins_left - 1
         remaining_amount = remaining_amount - coin
         # puts "unique_amount #{unique_amount }, #{coin} with #{remaining_amount} left "
         break
       end
    end
  end
  return remaining_amount == 0
end

(1..max_amount_cents).each do |unique_amount|
  if unique_amount_possible? unique_amount
      total_uniques << unique_amount
  else
  #   puts "#{unique_amount} not possible with coins setup"
  end
end

puts total_uniques.count
