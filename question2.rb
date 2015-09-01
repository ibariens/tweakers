@amount_perfect_squares = 0
@max_amount = 1000000000000000000
@numbers_found = []

def is_perfect_sqroot(number)
  res = Math.sqrt(number).to_i
  return res*res == number
end

def sum_of_numbers(number)
  (number.to_s.split('').inject{|sum,x| sum.to_i + x.to_i }).to_i
end

def fab(first_number, sec_number)
  if first_number > @max_amount
    puts "total is: #{@amount_perfect_squares}"
    return
  end
  if is_perfect_sqroot(sum_of_numbers(first_number))
    unless @numbers_found.include? first_number 
      @numbers_found << first_number
      @amount_perfect_squares = @amount_perfect_squares + 1
    end
  end

  fab(sec_number, first_number + sec_number)
end

fab(0,1)

