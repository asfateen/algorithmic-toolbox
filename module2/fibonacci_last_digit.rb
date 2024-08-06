def fib_last_digit(n)
  f=[] * (n+1)
  f[0]=0
  f[1]=1
  (2..n).each {|i| f[i] = (f[i - 1] % 10 + f[i - 2] % 10) % 10 }
  return f[n]
end


if __FILE__ == $0
  n = gets.to_i
  puts "#{fib_last_digit(n)}"
end