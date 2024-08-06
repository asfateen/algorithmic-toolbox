# Calculates the Pisano period for a given modulus.
#
# The Pisano period is the length of the cycle of Fibonacci numbers modulo m.
#
def pisanoPeriod(m)
  previous, current = 0, 1
  (m * m).times do |i|
    previous, current = current, (previous + current) % m
    return (i + 1) if previous == 0 && current == 1
  end
end

# Calculates the last digit of the sum of Fibonacci numbers in a given range.
#
# This function uses the Pisano period to efficiently compute the last digit of the sum
# of Fibonacci numbers from F(m) to F(n).
#
def fib_partial_sum(m, n)
  m_pisano = pisanoPeriod(10)
  n_pisano = pisanoPeriod(10)
  
  m = m % m_pisano
  n = n % n_pisano
  
  if n < m
    n += m_pisano
  end

  f = [0, 1]
  (2..n).each { |i| f[i] = (f[i - 1] + f[i - 2]) % 10 }

  sum = f[m..n].sum % 10
  return sum
end

if __FILE__ == $0
  m, n = gets.split.map(&:to_i)
  puts "#{fib_partial_sum(m, n)}"
end
