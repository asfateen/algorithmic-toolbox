# Calculates the maximum dot product of two arrays.
#
# This function computes the maximum dot product by sorting both arrays in ascending order
# and then calculating the sum of the products of corresponding elements.
#
def max_dot_product(a, b)
  a.sort!
  b.sort!
  a.size.times.collect { |i| a[i] * b[i] }.sum

end

if __FILE__ == $0
  data = STDIN.read.split().map(&:to_i)
  n = data[0]  
  a, b = data[1..n], data[n+1..2*n]
  puts "#{max_dot_product(a, b)}"
end