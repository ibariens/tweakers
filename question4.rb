@amount_of_days = 1000

def fab(index, total, first_number, sec_number)
  total = total + first_number
  # puts "day: #{index} diameter grows with #{first_number} resulting in total diameter of #{total}"

  if index == @amount_of_days
    return total
  end
  
  fab(index +1, total, sec_number, first_number + sec_number)
end
	
puts (fab(1, 0, 0, 1) * Math::PI) # 2.2095E+209
