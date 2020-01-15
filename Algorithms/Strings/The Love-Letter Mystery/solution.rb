#!/bin/ruby

require 'json'
require 'stringio'

# Complete the theLoveLetterMystery function below.
def theLoveLetterMystery(s)
    chars = s.chars
    size = chars.length
    sum = 0
    ((size+1)/2..(size -1)).each do |i|
        num = chars[i].ord
        target_num =  chars[size-1-i].ord
        sum += (num - target_num).abs
    end
    sum
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

q = gets.to_i

q.times do |q_itr|
    s = gets.to_s.rstrip

    result = theLoveLetterMystery s

    fptr.write result
    fptr.write "\n"
end

fptr.close()
