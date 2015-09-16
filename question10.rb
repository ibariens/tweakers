require 'ruby-progressbar'

@lines = File.open('vraag_10_triangle.txt').readlines
@max_amount = 0


till_number = 100000000
amount_omkeerbaar = 0
@progress_bar = ProgressBar.create( :format         => '%a %bᗧ%i %p%% %t',
                                    :progress_mark  => ' ',
                                    :remainder_mark => '･',
                                    :starting_at    => 0,
		                    :total => 2**(@lines.length-1))



def find_max(line_index, number_position, path)

  if line_index == @lines.length()
    sum_path    = path.inject(:+)
    @max_amount = sum_path if sum_path > @max_amount
    @progress_bar.increment
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
puts @max_amount
