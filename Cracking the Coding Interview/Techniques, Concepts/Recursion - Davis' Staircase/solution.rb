#!/bin/ruby

require 'json'
require 'stringio'

# Complete the stepPerms function below.
# def stepPerms(n)
#     cache = {0 => 1}
#     ways(n, cache)
# end
#
# def ways(n, cache)
#     return 0 if n < 0
#     return cache[n] if cache[n]
#
#     total = ways(n - 1, cache) + ways(n - 2, cache) + ways(n - 3, cache)
#     cache[n] = total
#     total
# end

def stepPerms(n)
  ways = []
  ways[0] = 1
  ways[1] = 1
  ways[2] = 2
  (3..n).each do |i|
    ways[i] = ways[i - 1] + ways[i - 2] + ways[i - 3]
  end
  ways[n]
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.to_i


s.times do |s_itr|
    n = gets.to_i

    res = stepPerms n

    fptr.write res
    fptr.write "\n"
end

fptr.close()
