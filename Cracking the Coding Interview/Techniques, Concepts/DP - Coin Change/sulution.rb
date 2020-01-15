#!/bin/ruby

require 'json'
require 'stringio'

def ways(n, coins)
  cache = {}
  combinations(n, coins, coins.length, cache)
end

def combinations(dollar, coins, size, cache)
  return 1 if dollar == 0 # do not include any coin is 1 ways
  return 0 if dollar < 0
  return 0 if size <= 0 # no any coins

  return cache[dollar] if cache[dollar] # already calculated

  res = combinations(dollar-coins[size-1], coins, size, cache) + combinations(dollar, coins, size-1, cache)
  cache[dollar] = res
  res
end


fptr = File.open(ENV['OUTPUT_PATH'], 'w')

nm = gets.rstrip.split

n = nm[0].to_i

m = nm[1].to_i

coins = gets.rstrip.split(' ').map(&:to_i)

res = ways n, coins

fptr.write res
fptr.write "\n"

fptr.close()
