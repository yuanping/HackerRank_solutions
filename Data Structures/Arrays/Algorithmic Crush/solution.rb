#!/bin/ruby

require 'json'
require 'stringio'

# Complete the arrayManipulation function below.
def arrayManipulation(n, queries)
    nums = Array.new(n+1, 0)
    queries.each do |query|
        nums[query[0]-1] += query[2]
        nums[query[1]] -= query[2]
    end

    max = nums.first
    (1..nums.length-1).each do |i|
        nums[i] += nums[i - 1]
        max = nums[i] if nums[i] > max && i < (nums.size - 1)
    end

    max
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

nm = gets.rstrip.split

n = nm[0].to_i

m = nm[1].to_i

queries = Array.new(m)

m.times do |i|
    queries[i] = gets.rstrip.split(' ').map(&:to_i)
end

result = arrayManipulation n, queries

fptr.write result
fptr.write "\n"

fptr.close()
