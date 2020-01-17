#!/bin/ruby

#
# Complete the contacts function below.
#

class Node
  attr_accessor :data, :children, :counter

  def initialize(d)
      @data = d
      @children = {}
      @counter = 1
  end
end

def add(root, name)
  name.length.times do |i|
      data = name[0, (i+1)]

      if root.children[data] 
          root.children[data].counter += 1
      else
          root.children[data] = Node.new(data)
      end
      
      root = root.children[data]
  end
end

def find(root, name)
  num = 0
  name.length.times do |i|
      data = name[0, (i+1)]

      if root.children[data] 
          num = root.children[data].counter
          root = root.children[data]
      else
          return 0
      end
  end
  num
end

def contacts(queries)
  res = []
  root = Node.new('0')
  queries.each do |action|
      if action.first == 'add'
          add(root, action[1])
      else
          res << find(root, action[1])
      end
  end
  res
end



fptr = File.open(ENV['OUTPUT_PATH'], 'w')

queries_rows = gets.to_i

queries = Array.new(queries_rows)

queries_rows.times do |queries_row_itr|
  queries[queries_row_itr] = gets.rstrip.split(' ').map(&:to_s)
end

result = contacts queries

fptr.write result.join "\n"
fptr.write "\n"

fptr.close()
