#!/bin/ruby
require 'prime'
require 'json'
require 'stringio'

# Complete the primality function below.
def primality(num)
    # Prime.prime?(n) ? 'Prime' : 'Not prime'
    is_prime?(num) ? 'Prime' : 'Not prime'
end

def is_prime?(num)
  return num >=2 if num <= 3
  return false if num % 2 == 0

  (3..Integer.sqrt(num)).step(2).each do |i|
    return false if num % i == 0
  end

  true
end



fptr = File.open(ENV['OUTPUT_PATH'], 'w')

p = gets.to_i

p.times do |p_itr|
    n = gets.to_i

    result = primality n

    fptr.write result
    fptr.write "\n"
end

fptr.close()
