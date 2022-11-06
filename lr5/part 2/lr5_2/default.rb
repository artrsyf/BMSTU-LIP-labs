# frozen_string_literal: true

require 'pry'

puts '0 is end of input'
a_unsorted = []
loop do
  x = gets.chomp.to_i
  break if x.zero?

  a_unsorted.push(x)
end
prev_count = count = 1
a_sorted = a_unsorted.sort
puts a_sorted
(1..a_sorted.length - 1).each do |i|
  if a_sorted[i] == a_sorted[i - 1] # { count += 1 } why doesn't work
    count += 1
  elsif count > prev_count
    prev_count = count
    count = 1
  end
end
puts prev_count
