#!/bin/ruby

require 'json'
require 'stringio'

def is_balanced(str)
    return false unless str.length % 2 == 0

    left =  {'{' => 1, '[' => 2, '(' => 3}
    right = {'}' => 1, ']' => 2, ')' => 3}
    stack = []
    str.chars.each do |char|
        open_char = left[char]
        if open_char
            stack << open_char
        else
            if stack.last == right[char]
                stack.pop
            else
                return false
            end
        end
    end

    stack.empty?
end

t = gets.to_i

t.times do |t_itr|
    expression = gets.to_s.rstrip
    puts is_balanced(expression) ? 'YES' : 'NO'
end
