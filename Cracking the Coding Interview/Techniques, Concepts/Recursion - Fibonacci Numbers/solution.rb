def fibonacci(n)
  if n == 0
      0
  elsif n == 1
      1
  else
      fibonacci(n - 1) + fibonacci(n - 2)
  end
end

def fibonacci(n)
prev = 0
curr = 1
(2..n).each do |i|
  res = prev + curr
  prev = curr
  curr = res
end

curr
end



n = gets.to_i
print(fibonacci(n))