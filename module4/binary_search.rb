# Performs binary search for an item in a sorted list.
#
# This function searches for an item in a sorted list using the binary search algorithm.
# It returns the index of the item if found, otherwise it returns -1. The list must be sorted for
# the binary search to work correctly.
#
def binary_search(item, list)
  low = 0
  high = list.length - 1
  
  while low <= high
    mid = (low + high) / 2
    guess = list[mid]

    return mid if guess == item

    if guess > item
      high = mid - 1
    else
      low = mid + 1
    end
  end
  -1
end

if __FILE__ == $0
  data = STDIN.read.split().map(&:to_i)
  n = data[0]
  a = data[1..n]
  m = data[n+1]
  data[n+2, m].each { |b| print("#{binary_search(b, a)} ") }
  puts ""
end
