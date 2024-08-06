
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