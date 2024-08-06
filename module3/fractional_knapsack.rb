# Finds the index of the item with the highest value-to-weight ratio.
#
# This function identifies the item with the maximum value per unit of weight from the list of items.
# It is used in the fractional knapsack problem to determine which item provides the most value for its weight.
#
def best_item(weights, values)
  bestItem = 0
  maxValuePerWeight = 0
  (0...weights.length).each do |i|
    if weights[i] > 0
      if values[i] / weights[i] > maxValuePerWeight
        maxValuePerWeight = values[i] / weights[i]
        bestItem = i
      end
    end
  end
  bestItem
end

# Computes the maximum value that can be obtained with a given knapsack capacity.
#
# This function solves the fractional knapsack problem by iteratively selecting the item with the highest
# value-to-weight ratio and adding as much of it as possible to the knapsack until the capacity is full.
#
def get_optimal_value(capacity, weights, values)
  totalValue = 0
  weights.length.times {
    return totalValue if capacity == 0
    i = best_item(weights, values)
    a = [weights[i], capacity].min
    totalValue += a * values[i] / weights[i]
    weights[i] -= a
    capacity -= a
  }
  totalValue


  
end

if __FILE__ == $0
  data = STDIN.read.split().map(&:to_f)
  n, capacity = data[0,2]
  values = data.values_at(*(2..2*n).step(2))
  weights = data.values_at(*(3..2*n+1).step(2))

  answer = get_optimal_value(capacity, weights, values)
  puts "#{'%.4f' % answer}"
end