# Calculates the last digit of the nth Fibonacci number.
#
# This function computes the last digit of the nth Fibonacci number using an iterative approach.
#
def pisanoPeriod(m)
  previous, current = 0, 1
  (m * m).times do |i|
    previous, current = current, (previous + current) % m
    return (i + 1) if previous == 0 && current == 1
  end

end

# Calculates the last digit of the nth Fibonacci number.
#
# This function computes the last digit of the nth Fibonacci number using the Pisano period
# to optimize the computation.
#
def fib_last_digit(n)
  pisano10 = pisanoPeriod(10)
  n = n % pisano10
  f=[] * (n+1)
  f[0]=0
  f[1]=1
  (2..n).each {|i| f[i] = (f[i - 1]+ f[i - 2]) % 10 }
  return f[n]
end

def fib_sum_of_squares(n)
  (fib_last_digit(n) * fib_last_digit(n + 1)) % 10
end

if __FILE__ == $0
  n = gets.to_i
  puts "#{fib_sum_of_squares(n)}"
end
