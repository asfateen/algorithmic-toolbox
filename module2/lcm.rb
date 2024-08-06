# Calculates the greatest common divisor (GCD) of two numbers using the Euclidean algorithm.
#
def gcd(a, b)
  return a if b == 0
  gcd(b, a % b)
end
# Calculates the least common multiple (LCM) of two numbers.
#
# This function computes the LCM of two integers a and b using their GCD.
# The LCM is calculated as the product of a and b divided by their GCD.
#
def lcm(a, b)
  a * b / gcd(a,b)
end

if __FILE__ == $0
  a, b = gets.split().map(&:to_i)
  puts "#{lcm(a, b)}"
end
