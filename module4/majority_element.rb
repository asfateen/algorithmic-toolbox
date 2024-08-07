# Determines the majority element in an array, if it exists, otherwise return nil
# The majority element is the element that appears more than half the time in the array.
#
def get_majority_element(a)
  candidate = get_majority_element_recursive(a, 0, a.length - 1)
  if count_occurrences(a, candidate) > a.length / 2
    candidate
  else
    nil
  end
end

# Recursively finds a candidate for the majority element using the divide-and-conquer approach.
#
def get_majority_element_recursive(nums, left, right)
  return nums[left] if left == right

  mid = left + (right - left) / 2
  leftMajority = get_majority_element_recursive(nums, left, mid)
  rightMajority = get_majority_element_recursive(nums, mid + 1, right)
  return leftMajority if leftMajority == rightMajority

  leftCount = count_occurrences(nums[left..right], leftMajority)
  rightCount = count_occurrences(nums[left..right], rightMajority)
  
  leftCount > rightCount ? leftMajority : rightMajority
end

# Counts the occurrences of a target element in an array.
#
def count_occurrences(nums, target)
  nums.count { |num| num == target }
end

if __FILE__ == $0
  n, *a = STDIN.read.split().map(&:to_i)
  puts "#{get_majority_element(a) ? 1 : 0}"
end
