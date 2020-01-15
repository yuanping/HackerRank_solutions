#!/bin/ruby

require 'json'
require 'stringio'

# Complete the countSwaps function below.
# def countSwaps(a)
#     size = a.length
#     counter = 0
#     (size - 1).times do |i|
#         (0..size-i-2).each do |j|
#             if a[j] > a[j + 1]
#                 swap(a, j, j+1)
#                 counter += 1
#             end
#         end
#     end
#     puts "Array is sorted in #{counter} swaps."
#     puts "First Element: #{a.first}"
#     puts "Last Element: #{a.last}"
# end

def countSwaps(a)
  size = a.length
  counter = 0
  loop_time = 0
  changed = true   # For optimize
  while(changed) do
    changed = false
    (0..size-2-loop_time).each do |j|
      if a[j] > a[j + 1]
        swap(a, j, j+1)
        counter += 1
        changed = true
      end
    end
    loop_time += 1
  end
  puts "Array is sorted in #{counter} swaps."
  puts "First Element: #{a.first}"
  puts "Last Element: #{a.last}"
end

def swap(a, i, j)
    temp = a[i]
    a[i] = a[j]
    a[j] = temp
end

n = gets.to_i

a = gets.rstrip.split(' ').map(&:to_i)

countSwaps a
