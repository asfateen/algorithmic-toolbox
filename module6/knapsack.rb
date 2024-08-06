# Utility function to find the maximum of two values.
#
def max(a, b)
  a > b ? a : b
end

#
# Solves the knapsack without replacement problem
#
def optimal_weight(capacity, weights)
  values = Array.new(weights.length + 1) { Array.new(capacity + 1, 0) }

  (1..weights.length).each do |i|
    (0..capacity).each do |w|
      values[i][w] = values[i - 1][w]
      if weights[i - 1] <= w
        values[i][w] = max(values[i][w], values[i - 1][w - weights[i - 1]] + weights[i - 1])
      end
    end
  end
  values[weights.length][capacity]
end


if __FILE__ == $0
  capacity, _, *weights = STDIN.read.split().map(&:to_i)
  puts optimal_weight(capacity, weights)
end
