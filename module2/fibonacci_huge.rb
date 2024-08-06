# Calculates the Pisano period for a given modulus.
#
# The Pisano period is the length of the cycle of Fibonacci numbers modulo m.
#
def pisanoPeriod(m)
  previous, current = 0, 1
  (0...m * m).each do |i|
    previous, current = current, (previous + current) % m
    return (i + 1) if previous == 0 && current == 1
  end

end

# Calculates the nth Fibonacci number modulo m.
#
# This function uses the Pisano period to efficiently compute the nth Fibonacci number modulo m.
#
def fib_huge(n, m)
  pisano_period = pisanoPeriod(m)
  n = n % pisano_period

  previous, current = 0, 1
    if n == 0
        return 0
    elsif n == 1
        return 1
    end
    (n - 1).times { previous, current = current, previous + current }
    return (current % m)
end

if __FILE__ == $0
  a, b = gets.split().map(&:to_i)
  puts "#{fib_huge(a, b)}"

end