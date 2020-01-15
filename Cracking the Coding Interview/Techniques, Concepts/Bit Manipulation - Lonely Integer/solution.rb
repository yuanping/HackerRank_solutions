#!/bin/ruby

require 'json'
require 'stringio'

# Complete the findLonely function below.
def findLonely(arr)
  hash = {}
  arr.each do |i|
    hash[i] ? hash.delete(i) : hash[i] = i
  end
  hash.keys.first
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.strip.to_i

arr = gets.rstrip.split.map(&:to_i)

res = findLonely arr

fptr.write res
fptr.write "\n"

fptr.close()
