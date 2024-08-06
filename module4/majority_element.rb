# Finds the majority element in an array if it exists.
#
# A majority element is an element that appears more than `n/2` times in the array,
# where `n` is the number of elements in the array.
#
def get_majority_element(nums)
  candidate = find_candidate(nums)
  count = count_occurrences(nums, candidate)
  return candidate if count > nums.size / 2
  nil
end
#
# This algorithm identifies a potential majority element by keeping a count that is incremented
# or decremented based on whether the current element matches the candidate.
#
def find_candidate(nums)
  count = 0
  candidate = nil
  nums.each do |num|
    if count == 0
      candidate = num
    end
    count += (num == candidate ? 1 : -1)
  end
  candidate
end

# Counts the number of occurrences of a specific element in an array.
#
def count_occurrences(nums, target)
  nums.count { |num| num == target }
end

if __FILE__ == $0
  n, *a = STDIN.read.split().map(&:to_i)
  puts "#{get_majority_element(a) ? 1 : 0}"
end
