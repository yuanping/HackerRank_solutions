#!/bin/ruby

require 'json'
require 'stringio'

# Complete the marsExploration function below.
def marsExploration(s)
    count = s.length / 3
    sum = 0
    count.times.each do |t|
        sum += 1 if s[3*t + 0] != 'S'
        sum += 1 if s[3*t + 1] != 'O'
        sum += 1 if s[3*t + 2] != 'S'
    end
    sum
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.to_s.rstrip

result = marsExploration s

fptr.write result
fptr.write "\n"

fptr.close()
