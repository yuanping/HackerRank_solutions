#!/bin/ruby

require 'json'
require 'stringio'

# Complete the whatFlavors function below.
def whatFlavors(cost, money)
    cost_hash = {}
    cost.each_with_index do |item, index|
        value = cost_hash[item]
        if value
            cost_hash[item] << index + 1
        else
            cost_hash[item] = [index + 1]
        end
    end

    cost_hash.keys.each do |price|
        first = cost_hash[price].first
        second_price = money - price
        next if second_price < 1
        if seconds = cost_hash[second_price]
            second = first == seconds.first ? seconds[1] : seconds[0]
            next unless second
            return [first, second].sort
        end
    end
end

t = gets.to_i

t.times do |t_itr|
    money = gets.to_i

    n = gets.to_i

    cost = gets.rstrip.split(' ').map(&:to_i)

    res = whatFlavors cost, money
    puts res.join(" ")
end
