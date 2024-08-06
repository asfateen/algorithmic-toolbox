def optimal_weight_items(capacity, weights)
  values = Array.new(weights.length + 1) { Array.new(capacity + 1, 0) }
  
  (1..weights.length).each do |i|
    (0..capacity).each do |w|
      values[i][w] = values[i - 1][w]
      if weights[i - 1] <= w
        values[i][w] = [values[i][w], values[i - 1][w - weights[i - 1]] + weights[i - 1]].max
      end
    end
  end

  items = []
  w = capacity
  (weights.length).downto(1) do |i|
    if values[i][w] != values[i - 1][w]
      items << weights[i - 1]
      w -= weights[i - 1]
    end
  end

  return items
end

def partition3(values)
  total_value =values.sum
  return false if total_value % 3 != 0
  knapsack_capacity = total_value / 3
  return false if values.any? {|value| value > knapsack_capacity }
  values.permutation.each do |current_permutation| 
    partitions = []
    3.times {|i|
      items = optimal_weight_items(knapsack_capacity, current_permutation)
      unless items.sum == knapsack_capacity
        return false if i == 0
        break
      end

      partitions << items
      items.each do |item|
        current_permutation.delete_at(current_permutation.index(item))
      end
    }
    return true if partitions.flatten.sum == knapsack_capacity * 3 # all equal

  end
  false
end


if __FILE__ == $0
  input = STDIN.read.split.map(&:to_i)
  input_n = input[0]
  input_values = input[1..-1]
  raise 'Input length does not match the specified number' unless input_n == input_values.length
  puts partition3(input_values) ? 1 : 0
end
