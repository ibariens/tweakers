require 'date'

# You could also just try the 4 different possibiliets of the question,
# but for completeness here we go.


states = ['Volle maan', 'Laatste kwartier', 'Nieuwe maan', 'Eerste kwartier']
days_for_state_change =  29.530588853 / 4

start_date  = Time.new(2015,3,5,19,06,34)
target_date = Time.new(2083,11,23,14,00,00)

amount_of_state_changes = (target_date - start_date) / days_for_state_change
puts states[(amount_of_state_changes % 4).to_i] 
