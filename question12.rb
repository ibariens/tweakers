attack_order = ['warrior', 'mage', 'rogue']
monsters = [300, 600, 850, 900, 1100, 3500]
total_overkill = 0

def warrior_damage(seconds)
  return seconds % 4 == 0 ? 35 : 0
end

def rogue_damage(seconds)
  damage = 0
  damage = damage + 30 if seconds % 4 == 0
  damage = damage + 20 if seconds % 3 == 0
  return damage
end

def mage_damage(seconds)
  seconds = seconds - 2
  return seconds % 8 == 0 ? 80 : 0
end

monsters.each do |monster|
  overkill = 0
  seconds  = 0
  total_damage = 0
  monster_dead = false

  while total_damage < monster
      attack_order.each do |attacker|
        unless monster_dead
          attacker_damage = send("#{attacker}_damage", seconds)
          total_damage = total_damage + attacker_damage
          #puts "#{attacker} attacks in second #{seconds} with  #{attacker_damage} to monster #{monster}. Total damage to monster is: #{total_damage}"
          #sleep 0.2
          if total_damage >= monster
            monster_dead = true
            total_overkill = total_overkill + total_damage - monster if attacker == 'warrior'
            puts "monster dead by #{attacker}, total warrior_overkill of: #{total_overkill}"
          end
      end

    end
            seconds = seconds + 1
  end
end
puts total_overkill
