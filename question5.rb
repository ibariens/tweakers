# code from http://codereview.stackexchange.com/questions/7937/roman-numeral-converter http://codereview.stackexchange.com/questions/7937/roman-numeral-converter

class Fixnum
  ROMAN_NUMBERS = {
    1000 => "M",
     900 => "CM",
     500 => "D",
     400 => "CD",
     100 => "C",
      90 => "XC",
      50 => "L",
      40 => "XL",
      10 => "X",
        9 => "IX",
        5 => "V",
        4 => "IV",
        1 => "I",
  }

  def roman
    n = self
    roman = ""
    ROMAN_NUMBERS.each do |value, letter|
      roman << letter*(n / value)
      n = n % value
    end
    return roman
  end
end

amount_of_stones = 12500000
year = 0

def stones_needed(year)
  year.roman.length * 250
end

def earth_quake_factor(year)
  if year%43 == 0
    return 1-0.15
  else
    return 1
  end
end

while amount_of_stones > 0
  year = year + 1
  amount_of_stones = amount_of_stones*earth_quake_factor(year)
  amount_of_stones = amount_of_stones - stones_needed(year)

  puts "in year: #{year} (#{year.roman}) we have #{amount_of_stones} left"
end
