@amount_of_days = 1000

def fab(index, first_number, sec_number)
  if index == @amount_of_days
    return first_number
  end
  fab(index +1, sec_number, first_number + sec_number)
end
	
puts (fab(0, 0, 1) * Math::PI)
