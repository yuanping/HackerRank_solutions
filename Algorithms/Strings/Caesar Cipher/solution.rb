#!/bin/ruby

require 'json'
require 'stringio'

# Complete the caesarCipher function below.
def caesarCipher(s, k)
    low_letters = ('a'..'z').to_a
    up_letters = ('A'..'Z').to_a
    res = []
    s.chars.each do |c|
        if(/[A-Z]/.match c)
            i = (up_letters.find_index(c) + k) % 26
            res << up_letters[i]
        elsif(/[a-z]/.match c)
            i = (low_letters.find_index(c) + k) % 26
            res << low_letters[i]
        else
            res << c
        end 
    end
    res.join
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

s = gets.to_s.rstrip

k = gets.to_i

result = caesarCipher s, k

fptr.write result
fptr.write "\n"

fptr.close()
