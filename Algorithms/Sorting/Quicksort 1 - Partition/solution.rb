#!/bin/ruby

require 'json'
require 'stringio'

# Complete the quickSort function below.
def quickSort(arr)
    partation(arr)
    arr
end

def partation(arr)
    pivot_index = 0
    pivot_value = arr[pivot_index]
    index = 0

    # put pivot to last
    swap(arr, pivot_index, arr.length - 1)

    arr.each_with_index do |a, i|
        if a < pivot_value
            swap(arr, index, i)
            index += 1
        end
    end

    swap(arr, index, arr.length - 1)
    index
end

def swap(arr, x, y)
    temp = arr[x]
    arr[x] = arr[y]
    arr[y] = temp
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

arr = gets.rstrip.split(' ').map(&:to_i)

result = quickSort arr

fptr.write result.join " "
fptr.write "\n"

fptr.close()
