
def edit_distance(a, b)
  n = a.length
  m = b.length
  d = Array.new(n + 1) { Array.new(m + 1) }

  (0..n).each do |i|
    d[i][0] = i
  end

  (0..m).each do |j|
    d[0][j] = j
  end

  (1..n).each do |i|
    (1..m).each do |j|
      insertion = d[i][j - 1] + 1
      deletion = d[i - 1][j] + 1
      match = d[i - 1][j - 1]
      mismatch = d[i - 1][j - 1] + 1
      if a[i - 1] == b[j - 1]
        d[i][j] = [insertion, deletion, match].min
      else
        d[i][j] = [insertion, deletion, mismatch].min
      end
    end
  end

  d[n][m]
end


if __FILE__ == $0
  a, b = gets, gets
  puts edit_distance(a, b)
end
