#!/bin/ruby

def median_racker(arr)

end


fptr = File.open(ENV['OUTPUT_PATH'], 'w')
n = gets.to_i
a = []

n.times do |i|
  item = gets.to_i
  a[i] = item
end

res = median_racker(a)

fptr.write result.join '\n'
fptr.write '\n'

fptr.close
