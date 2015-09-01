x1, y1, z1 = [30,50,90]
x2, y2, z2 = [4096, 65536,9]

dx, dy, dz = [(x2-x1),(y2-y1),(z2-z1)]
 
distance_two_points = Math.sqrt((x1-x2)**2+(y1-y2)**2+(z1-z2)**2)   
distance_travelled = 20*60*25

percentage_travelled = distance_travelled / distance_two_points
puts x1 + dx*percentage_travelled
puts y1 + dy*percentage_travelled
puts z1 + dz*percentage_travelled

# answer needs to be very specific:  x:1.889,11 y:29.992,32 z:52,96
