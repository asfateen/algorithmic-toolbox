# This function computes the nth Fibonacci number using an iterative approach.
#
def calc_fib(n)
  f=[] * (n+1)
  f[0]=0
  f[1]=1
  (2..n).each {|i| f[i] = f[i - 1] + f[i - 2] }
  return f[n]
end

if __FILE__ == $0
  n = gets.to_i
  puts "#{calc_fib(n)}"
end
