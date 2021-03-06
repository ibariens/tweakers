# Very inefficient, could use some major speed improvements
# For now we just use a progress-bar indicator :)
# Install progress-bar with: ge instal ruby-progressbar


require 'ruby-progressbar'

till_number = 100000000
amount_omkeerbaar = 0
progress_bar = ProgressBar.create( :format         => '%a %bᗧ%i %p%% %t',
                                   :progress_mark  => ' ',
                                   :remainder_mark => '･',
                                   :starting_at    => 0,
		                   :total => till_number)
def is_even?(number)
  return  number%2 == 0
end

def all_numbers_uneven?(number)
  num_string = number.to_s
  is_uneven = true
  (0..(num_string.length-1)).each do |decimal|
    if is_even?(num_string[decimal].to_i)
      is_uneven = false
    end
  end
  return is_uneven
end

def reverse_number(number)
  reversed = []
  num_string = number.to_s
  (0..(num_string.length-1)).each do |digit|
    reversed.unshift(num_string[digit])
  end
  return reversed.join("").to_i
end


(0..till_number).each do |number|
  progress_bar.increment
  if number%10 == 0
    # puts "ignore #{number}"
  else
    num_size = number.to_s.length
    sum = number + reverse_number(number)
    omkeerbaar = all_numbers_uneven?(sum)
    amount_omkeerbaar += 1 if omkeerbaar
    # puts "#{number} all numbers uneven? #{all_numbers_uneven?(number)} and reverse: #{reverse_number(number)} and is omkeerbaar: #{omkeerbaar}"
  end
end

puts "totaal omkeerbaar #{amount_omkeerbaar}"

