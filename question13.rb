healthy_people = 7000000000
attacking_zombies = 1

day = 0
hours  = 0..23
current_hour = 0

def attacks_in_hour_per_zombie(current_hour)
  if current_hour >= 8 && current_hour < 22
    return 2
  else
    return 1
  end
end

def get_escaped_attacks(day, current_hour, total_attacks)
  if day == 0 && current_hour < 8
    return 0
  else
    # puts "#{total_attacks / 3} attacks escaped, total attacks: #{total_attacks}, total sucesfull: #{total_attacks - (total_attacks / 3)} "
    return (total_attacks / 3)
  end
end

def get_wounded_people(total_attacks)
  return total_attacks / 5
end


while healthy_people > 0
  hours.each do |hour|
    wounded_people = 0
    escaped_attacks = 0

    attacks = attacking_zombies * attacks_in_hour_per_zombie(hour)
    escaped_attacks = get_escaped_attacks(day, hour, attacks)
    wounded_people = get_wounded_people(attacks)

    succesful_attacks = attacks - escaped_attacks - wounded_people

    healthy_people = healthy_people - succesful_attacks
    if healthy_people < 1
      puts "in hour #{day * 24 + hour} all people are dead, so after #{day * 24 + hour + 1} hours the human race is extict"
      break
    end

    attacking_zombies = attacking_zombies + succesful_attacks

    puts  "day: #{day} and hour #{hour+1}. Beginning of this hour #{healthy_people} are still healthy and #{attacking_zombies} zombies are able to attack other people. #{wounded_people} people are wounded/dead. #{escaped_attacks} attacks are escaped"

  end
  day = day + 1
end
