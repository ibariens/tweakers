lines = File.open('vraag_11_numbers.txt').readlines
total = 0

# http://stackoverflow.com/questions/3594345/ruby-determine-if-a-number-is-a-prime
def prime?(n)
   return false if n < 2
   (2..Math.sqrt(n)).none? {|num| n % num == 0}
 end

lines.each do |line|
  line.split(" ").each do |number|
    total = total + 1 if prime?(number.to_i)
  end
end

puts total
