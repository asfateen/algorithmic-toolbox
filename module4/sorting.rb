# Partitions an array into three parts based on a pivot element.
#
# This method partitions the array `a` between indices `l` and `r` into
# three segments: elements less than the pivot, elements equal to the pivot,
# and elements greater than the pivot. The pivot element is chosen as `a[l]`.
#
def partition3(a, l, r)
  x = a[l]
  m1 = l
  m2 = r
  i = l + 1
  while i <= m2
    if a[i] < x
      a[i], a[m1] = a[m1], a[i]
      m1 += 1
      i += 1
    elsif a[i] > x
      a[i], a[m2] = a[m2], a[i]
      m2 -= 1
    else
      i += 1
    end
  end
  [m1, m2]
end

# Performs a randomized quicksort on the array.
#
# This method recursively sorts the array `a` between indices `l` and `r`
# using the randomized quicksort algorithm. A random element is chosen as the
# pivot, and the array is partitioned into three parts: elements less than
# the pivot, elements equal to the pivot, and elements greater than the pivot.
#
def randomized_quick_sort(a, l, r)
  return nil if l >= r

  k = rand(l..r)
  a[l], a[k] = a[k], a[l]
  m = partition3(a, l, r)
  m1, m2 = m[0], m[1]
  randomized_quick_sort(a, l, m1 - 1);
  randomized_quick_sort(a, m2 + 1, r);
end

if __FILE__ == $0
  n, *a = STDIN.read.split().map(&:to_i)
  randomized_quick_sort(a, 0, n - 1)
  puts "#{a.join(' ')}"
end
