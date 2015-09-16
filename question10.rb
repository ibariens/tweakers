@lines = File.open('vraag_10_triangle.txt').readlines
@max_amount = 0
@current_possibility = 0
@total_possibilities = 2**(@lines.length-1)

def find_max(line_index, number_position, path)

  if line_index == @lines.length()
    sum_path    = path.inject(:+)
    @max_amount = sum_path if sum_path > @max_amount
    @current_possibility = @current_possibility + 1
    print "\r#{@current_possibility} of #{@total_possibilities} complete = #{(@current_possibility.to_f / @total_possibilities.to_f * 100).round(2)}%"

  else
    positions = [number_position, number_position+1]
    new_line_index = line_index + 1

    positions.each do |pos|
      unless (@lines[line_index].split(' ')[pos]).nil?
        copy = Array[]
        copy.concat path
        copy << (@lines[line_index].split(' ')[pos]).to_i

        find_max(new_line_index, pos, copy)
      end
    end
  end
end

find_max(0,0, [])
puts "--Outcome: #{@max_amount}"
