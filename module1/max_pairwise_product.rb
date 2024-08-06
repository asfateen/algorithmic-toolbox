
# Calculates the maximum pairwise product of an array.
def max_pairwise_product(a)
  max1 = a.max
  a.delete_at(a.index(max1))
  max2 = a.max
  max1 * max2
end

if __FILE__ == $0
  data = STDIN.read.split().map(&:to_i)
  n = data[0]
  a = data[1..n]
  puts "#{max_pairwise_product(a)}"
end