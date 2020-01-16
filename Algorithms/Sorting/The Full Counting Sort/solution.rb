#!/bin/ruby

require 'json'
require 'stringio'

# Complete the countSort function below.
def count_sort(arr)
    size = arr.length
    # Replace array first half to -
    (0..(size/2-1)).each do |i|
        arr[i][1] = '-'
    end

    # Counting array
    count = Array.new(100, 0)
    arr.each do |row|
        count[row[0]] += 1
    end

    # Sum counting array
    (1..(count.size - 1)).each do |i|
        count[i] += count[i-1]
    end

    #Output array
    res = []

    (0..(size-1)).reverse_each do |i|
        index = count[arr[i][0]] - 1
        res[index] = arr[i][1]
        count[arr[i][0]] -= 1
    end
    puts res.join(" ")
end

n = gets.strip.to_i

arr = Array.new(n)

n.times do |i|
    arr[i] = gets.rstrip.split
    arr[i][0] = arr[i][0].to_i
end

count_sort arr
