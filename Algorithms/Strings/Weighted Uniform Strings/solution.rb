#!/bin/ruby

require 'json'
require 'stringio'

# Complete the weightedUniformStrings function below.
# Time complexity: O(n)
def weightedUniformStrings(s, queries)
    cache = {}
    pre_char = nil
    count = 1
    s.chars.each do |char|
        if char == pre_char
            count += 1
        else
            pre_char = char
            count = 1
        end

        weight = char.ord - 96
        cache[weight * count] = 'Yes'
    end

    queries.map do |num|
        cache[num] ? 'Yes' : 'No'
    end
end


# def weightedUniformStrings(s, queries)
#     queries.map do |num|
#         find_weight(s, num)
#     end
# end

# def find_weight(s, num)
#     ('a'..'z').each_with_index do |letter, i|
#         weight = letter.ord - 96
#         next unless num % weight == 0

#         count = num / weight
#         return 'Yes' if s.include?(letter * count)
#     end
#     'No'
# end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.to_s.rstrip

queries_count = gets.to_i

queries = Array.new(queries_count)

queries_count.times do |i|
    queries_item = gets.to_i
    queries[i] = queries_item
end

result = weightedUniformStrings s, queries

fptr.write result.join "\n"
fptr.write "\n"

fptr.close()
