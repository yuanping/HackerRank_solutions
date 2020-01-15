#!/bin/ruby

require 'json'
require 'stringio'

# Complete the marcsCakewalk function below.
def marcsCakewalk(calorie)
    arr = calorie.sort.reverse!

    sum = 0
    arr.each_with_index do |cal, index|
        sum += cal * (2**index)
    end
    sum
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

calorie = gets.rstrip.split(' ').map(&:to_i)

result = marcsCakewalk calorie

fptr.write result
fptr.write "\n"

fptr.close()
