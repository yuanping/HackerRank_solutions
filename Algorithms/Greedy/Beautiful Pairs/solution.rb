#!/bin/ruby

require 'json'
require 'stringio'

# Complete the beautifulPairs function below.
def beautifulPairs(a1, a2)
    h1 = {}

    a1.each do |a|
        h1[a] ? h1[a] += 1 : h1[a] = 1     
    end

    count = 0
    a2.each do |b|
        if h1[b] && h1[b] > 0
            h1[b] -= 1
            count += 1
        end
    end

    count == a1.size ? count - 1 : count + 1
end



fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

a = gets.rstrip.split(' ').map(&:to_i)

b = gets.rstrip.split(' ').map(&:to_i)

result = beautifulPairs a, b

fptr.write result
fptr.write "\n"

fptr.close()
