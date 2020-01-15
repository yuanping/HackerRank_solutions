#!/bin/ruby

require 'json'
require 'stringio'

# Complete the makeAnagram function below.
def makeAnagram(a, b)
    a_chars = a.chars
    b_chars = b.chars
    
    a_chars.length.times do |ai|
        b_chars.each_with_index do |item, index|
            if a_chars[ai] == item
                b_chars.delete_at index
                a_chars[ai] = nil
                break
            end
        end
    end

    a_chars.compact.length + b_chars.length
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

a = gets.to_s.rstrip

b = gets.to_s.rstrip

res = makeAnagram a, b

fptr.write res
fptr.write "\n"

fptr.close()
