x = gets.chomp.to_i
y = gets.chomp.to_i
a = 1 + (y - x).abs + ((y - x)**2).fdiv(2) + (((y - x).abs)**3).fdiv(3)
puts(a)
