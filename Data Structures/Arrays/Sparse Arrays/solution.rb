#!/bin/ruby

require 'json'
require 'stringio'

# Complete the matchingStrings function below.
def matchingStrings(strings, queries)
    counting_hash = {}
    counting_hash.default = 0

    # For Cache
    strings.each do |s|
        counting_hash[s] ? counting_hash[s] += 1 : counting_hash[s] = 1
    end

    res = []
    queries.each do |q|
        res << counting_hash[q]
    end
    res
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

strings_count = gets.to_i

strings = Array.new(strings_count)

strings_count.times do |i|
    strings_item = gets.to_s.rstrip
    strings[i] = strings_item
end

queries_count = gets.to_i

queries = Array.new(queries_count)

queries_count.times do |i|
    queries_item = gets.to_s.rstrip
    queries[i] = queries_item
end

res = matchingStrings strings, queries

fptr.write res.join "\n"
fptr.write "\n"

fptr.close()
