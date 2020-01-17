#!/bin/ruby

require 'json'
require 'stringio'

# Complete the gemstones function below.
def gemstones(arr)
    common_chars = ('a'..'z').to_a
    arr.each do |a|
        common_chars = common_chars & a.chars
    end
    common_chars.size
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

arr = Array.new(n)

n.times do |i|
    arr_item = gets.to_s.rstrip
    arr[i] = arr_item
end

result = gemstones arr

fptr.write result
fptr.write "\n"

fptr.close()
