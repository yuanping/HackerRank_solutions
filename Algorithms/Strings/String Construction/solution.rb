#!/bin/ruby

require 'json'
require 'stringio'

# Complete the stringConstruction function below.
def stringConstruction(s)
    s.chars.uniq.size
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

q = gets.to_i

q.times do |q_itr|
    s = gets.to_s.rstrip

    result = stringConstruction s

    fptr.write result
    fptr.write "\n"
end

fptr.close()
