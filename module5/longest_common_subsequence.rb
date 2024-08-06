def longest_common_subsequence(arr1, arr2)
  cell = Array.new(arr1.length + 1) { Array.new(arr2.length + 1, 0) }

  (1..arr1.length).each do |i|
    (1..arr2.length).each do |j|
      if arr1[i-1] == arr2[j-1]
        cell[i][j] = cell[i-1][j-1] + 1
      else
        cell[i][j] = [cell[i-1][j], cell[i][j-1]].max
      end
    end
  end

  cell[arr1.length][arr2.length]
end

if __FILE__ == $0
  n = gets.to_i
  a = gets.split.map(&:to_i)
  raise "Assertion failed" unless a.length == n

  m = gets.to_i
  b = gets.split.map(&:to_i)
  raise "Assertion failed" unless b.length == m

  puts longest_common_subsequence(a, b)
end

