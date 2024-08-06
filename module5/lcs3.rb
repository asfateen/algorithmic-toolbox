# Computes the length of the longest common subsequence among three arrays using dynamic programming.
#
def lcs3(arr1, arr2, arr3)
  cell = Array.new(arr1.length + 1) { Array.new(arr2.length + 1) { Array.new(arr3.length + 1, 0)}}

  (1..arr1.length).each do |i|
    (1..arr2.length).each do |j|
      (1..arr3.length).each do |k|
        if arr1[i-1] == arr2[j-1] && arr1[i-1] == arr3[k-1]
          cell[i][j][k] = cell[i-1][j-1][k-1] + 1
        else
          cell[i][j][k] = [cell[i-1][j][k], cell[i][j-1][k], cell[i][j][k-1]].max
        end
      end
    end
  end

  cell[arr1.length][arr2.length][arr3.length]
end

if __FILE__ == $0
  data = STDIN.read.split().map(&:to_i)
  n = data[0]
  a = data[1..n]
  m = data[n+1]
  b = data[n+2..n+1+m]
  c = data[n+3+m..-1]
  puts lcs3(a, b, c)
end
