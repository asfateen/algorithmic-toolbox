# Calculates the optimal summands that add up to a given number.
#
# This function finds the maximum number of distinct positive integers that sum up to a given number `n`.
# It greedily starts by adding the smallest possible integers (1, 2, 3, ...) until the sum would exceed `n`.
# If there is any remainder, it adjusts the last summand to include the remaining amount.
#
# @example
#   optimal_summands(6) # => [1, 2, 3]
#   optimal_summands(8) # => [1, 2, 5]
#
def optimal_summands(n)
  summands = []
  sum = 0
  k = 1

  while sum + k <= n
    summands << k
    sum += k
    k += 1
  end
  summands[-1] += n - sum if sum < n

  summands
end

if __FILE__ == $0
  n = gets.to_i
  summands = optimal_summands(n)
  puts "#{summands.size}"
  puts "#{summands.join(' ')}"
end