#!/bin/ruby

require 'json'
require 'stringio'

# Complete the superReducedString function below.
def superReducedString(s)
    return 'Empty String' if s.nil? || s == ''

    size = s.length
    chars = s.chars
    (0..(size - 2)).each do |i|
        if chars[i] == chars[i + 1]
            chars[i] = nil
            chars[i + 1] = nil
        end
    end
    s = chars.join
    return 'Empty String' if s.nil? || s == ''
    return superReducedString(s) if s.length != size
    
    s
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.chomp

result = superReducedString s

fptr.write result
fptr.write "\n"

fptr.close()
