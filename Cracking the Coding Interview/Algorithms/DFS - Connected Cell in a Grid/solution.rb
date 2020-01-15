#!/bin/ruby

require 'json'
require 'stringio'
require 'set'

# Complete the maxRegion function below.
def maxRegion(grid)
    reg_arr = []
    checked_items = Set[]
    y_scope = grid.length
    x_scope = grid.first.length
    puts "x_scope:#{x_scope}"
    puts "y_scope:#{y_scope}"
    grid.each_with_index do |row, y|
        row.each_with_index do |col, x|
            item_id = "#{x}#{y}"
            if col == 1 && !checked_items.include?(item_id)
                # First item
                reg = [item_id]
                find_neb(x, y, reg, x_scope, y_scope, grid)
                checked_items += reg
                reg_arr << reg
            end
        end
    end
    max_num = 0
    reg_arr.each do |reg|
        max_num = [reg.size, max_num].max
        puts reg.to_s
    end
    max_num
end

def find_neb(x, y, arr, x_scope, y_scope, grid)
    if x + 1 < x_scope
        # Left neighbor
        add_to_array(x+1, y, arr, x_scope, y_scope, grid)

        if y + 1 < y_scope
            # Left Bottom neighbor
            add_to_array(x+1, y+1, arr, x_scope, y_scope, grid)
        end

        if y - 1 >= 0
            # Left Up neighbor
            add_to_array(x+1, y-1, arr, x_scope, y_scope, grid)
        end
    end

    if x - 1 >= 0
        # Right neighbor
        add_to_array(x-1, y, arr, x_scope, y_scope, grid)

        if y + 1 < y_scope
            # Right Bottom neighbor
            add_to_array(x-1, y+1, arr, x_scope, y_scope, grid)
        end

        if y - 1 >= 0
            # Right Up neighbor
            add_to_array(x-1, y-1, arr, x_scope, y_scope, grid)
        end
    end

    if y + 1 < y_scope
        # Bottom neighbor
        add_to_array(x, y+1, arr, x_scope, y_scope, grid)
    end

    if y - 1 >= 0
        # Up neighbor
        add_to_array(x, y-1, arr, x_scope, y_scope, grid)
    end
end

def add_to_array(x, y, array, x_scope, y_scope, grid)
    if grid[y][x] == 1
        item_id = "#{x}#{y}"
        unless array.include?(item_id)
            array << item_id 
            find_neb(x, y, array, x_scope, y_scope, grid)
        end
    end
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

m = gets.to_i

grid = Array.new(n)

n.times do |i|
    grid[i] = gets.rstrip.split(' ').map(&:to_i)
end

res = maxRegion grid

fptr.write res
fptr.write "\n"

fptr.close()
