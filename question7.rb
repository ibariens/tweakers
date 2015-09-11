require 'rmagick'

answer = []
img = Magick::ImageList.new(File.expand_path('question7.jpeg')).first
img.each_pixel do |pixel, x, y|
  if (x > 10 && x < 170) && (y > 10 && y < 110)
    if pixel.red == 0
      puts "#{x},#{y} -------- #{pixel}"
      answer << [x,y]
    end
  end
end

answer =  answer.sort_by {|x| x.first}
answer.each do |ans|
  puts ans.join(",")
end
