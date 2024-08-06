def binary_search_with_duplicates(item, list)
  low = 0
  high = list.length - 1
  result = -1
  
  while low <= high
    mid = (low + high) / 2
    guess = list[mid]

    if guess == item
      result = mid
      high = mid - 1  
    elsif guess > item
      high = mid - 1
    else
      low = mid + 1
    end
  end
  result
end


if __FILE__ == $0
  data = STDIN.read.split().map(&:to_i)
  n = data[0]
  a = data[1..n]
  m = data[n+1]
  data[n+2, m].each { |b| print("#{binary_search_with_duplicates(b, a)} ") }
  puts ""
end
