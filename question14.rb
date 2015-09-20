total_revenue =
# amount * price * discount
5  *  59  * 0.9   +   # customer A
12 *  16  * 0.7   +
3  *  412 * 1     +
6  *  95  * 0.95  +
1  * 165  * 0.95  +   # customer guest
2 * 599 * 0.9 +
5 * 129 * (1-[0.2, 0.3].max)

puts total_revenue 
