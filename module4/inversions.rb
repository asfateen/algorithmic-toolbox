# Copies elements from one array to another within a specified range.
#
def copy(a, b, l, r)
  while l < r
    b[l] = a[l]
    l += 1
  end
end
# Merges two sorted subarrays and counts the number of inversions.
#
def merge_and_count(a, b, left, mid, right)
  i = left
  j = mid
  k = left
  number_of_inversions = 0

  while i < mid && j < right
    if a[i] <= a[j]
      b[k] = a[i]
      i += 1
    else
      b[k] = a[j]
      number_of_inversions += mid - i
      j += 1
    end
    k += 1
  end

  while i < mid
    b[k] = a[i]
    i += 1
    k += 1
  end

  while j < right
    b[k] = a[j]
    j += 1
    k += 1
  end

  (left...right).each do |i|
    a[i] = b[i]
  end

  number_of_inversions
end

# Computes the total number of inversions in an array using merge sort.
#
def get_number_of_inversions(a, b, left, right)
  number_of_inversions = 0
  return 0 if right - left <= 1

  mid = left + (right - left) / 2
  number_of_inversions += get_number_of_inversions(a, b, left, mid)
  number_of_inversions += get_number_of_inversions(a, b, mid, right)
  number_of_inversions += merge_and_count(a, b, left, mid, right)

  number_of_inversions
end

if __FILE__ == $0
  n, *a = STDIN.read.split().map(&:to_i)
  b = Array.new(n, 0)
  puts get_number_of_inversions(a, b, 0, n)
end
