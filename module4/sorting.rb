
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




def partition2(a, l, r)
  x = a[l]
  j = l
  (l + 1..r).each do |i|
    if a[i] <= x
      j += 1
      a[i], a[j] = a[j], a[i]
    end
  end
  a[l], a[j] = a[j], a[l]
  j
end

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
