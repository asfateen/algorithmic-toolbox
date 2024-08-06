# Calculates the greatest common divisor (GCD) of two numbers using the Euclidean algorithm.
#
def gcd(a, b)
  return a if b == 0
  gcd(b, a % b)
end

if __FILE__ == $0
  a, b = gets.split().map(&:to_i)
  puts "#{gcd(a, b)}"
end