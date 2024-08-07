
# Determines if an array can be partitioned into 3 subsets with equal sum.
#
def partition3subsets(nums)
  total = nums.sum
  return false if total % 3 != 0

  nums.sort!
  subset_sum = total / 3
  visited = Array.new(nums.length, false)
  can_partition(nums, visited, 0, 3, 0, subset_sum)
end

# This function uses recursion and backtracking to try and form 'k' subsets,
# each with a sum of 'subset_sum'. It keeps track of the current sum of the subset
# being formed and marks elements as visited to avoid reuse.
#
def can_partition(nums, visited, start, k, cur_sum, subset_sum)
  return true if k == 0
  return can_partition(nums, visited, 0, k - 1, 0, subset_sum) if cur_sum ==  subset_sum

  (start...nums.length).each do |i|
    next if visited[i] || cur_sum + nums[i] > subset_sum

    visited[i] = true
    return true if can_partition(nums, visited, i + 1, k, cur_sum + nums[i], subset_sum)
    visited[i] = false
  end
  false
end 



if __FILE__ == $0
  input = STDIN.read.split.map(&:to_i)
  input_n = input[0]
  input_values = input[1..-1]
  raise 'Input length does not match the specified number' unless input_n == input_values.length
  puts partition3subsets(input_values) ? 1 : 0
end
