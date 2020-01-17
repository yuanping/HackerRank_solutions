#!/bin/ruby

require 'json'
require 'stringio'

# Complete the gridChallenge function below.
def gridChallenge(grid)
    grid.each do |row|
        row.sort!
    end
    columns = grid.first.size
    size = grid.size

    
    (0..(columns - 1)).each do |col|
        list = []
        (0..(size -1)).each do |row|  
            list << grid[row][col]
        end
        return 'NO' if list != list.sort
    end

    'YES'
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

t = gets.to_i

t.times do |t_itr|
    n = gets.to_i

    grid = Array.new(n)

    n.times do |i|
        grid_item = gets.to_s.rstrip.chars
        grid[i] = grid_item
    end

    result = gridChallenge grid

    fptr.write result
    fptr.write "\n"
end

fptr.close()
