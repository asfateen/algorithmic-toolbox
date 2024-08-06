def get_majority_element(nums)
  candidate = find_candidate(nums)
  count = count_occurrences(nums, candidate)
  return candidate if count > nums.size / 2
  nil
end

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

def count_occurrences(nums, target)
  nums.count { |num| num == target }
end

if __FILE__ == $0
  n, *a = STDIN.read.split().map(&:to_i)
  puts "#{get_majority_element(a) ? 1 : 0}"
end
