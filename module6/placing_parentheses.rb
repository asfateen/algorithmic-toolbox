# Evaluates the result of applying an operation to two numbers.
#
def evaluate(a, op, b)
  ops = {
    '+' => ->(x, y) { x + y },
    '-' => ->(x, y) { x - y },
    '*' => ->(x, y) { x * y }
  }
  ops[op].call(a, b)
end

# Computes the maximum value of an arithmetic expression given a list of numbers and operations.
# Utilizes dynamic programming to find the optimal placement of parentheses.
#
def get_maximum_value(numbers, operations)
  n = numbers.length
  mmin = Array.new(n) { Array.new(n) }
  mmax = Array.new(n) { Array.new(n) }

  (0...n).each do |i|
    mmin[i][i] = numbers[i]
    mmax[i][i] = numbers[i]
  end
  
  # Fills the DP table with minimum and maximum values for subexpressions
  def min_and_max(i, j, mmin, mmax, operations)
    min = Float::INFINITY
    max = -Float::INFINITY
    (i...j).each do |k|
      a = evaluate(mmax[i][k], operations[k], mmax[k + 1][j])
      b = evaluate(mmax[i][k], operations[k], mmin[k + 1][j])
      c = evaluate(mmin[i][k], operations[k], mmax[k + 1][j])
      d = evaluate(mmin[i][k], operations[k], mmin[k + 1][j])
      min = [min, a, b, c, d].min
      max = [max, a, b, c, d].max
    end
    [min, max]
  end

  (1...n).each do |s|
    (0...(n - s)).each do |i|
      j = i + s
      mmin[i][j], mmax[i][j] = min_and_max(i, j, mmin, mmax, operations)
    end
  end

  mmax[0][n - 1]
end

if __FILE__ == $0
  s = gets.chomp.split('')
  numbers = s.each_slice(2).map { |slice| slice.first.to_i }
  operations = s.drop(1).each_slice(2).map(&:first)
  puts get_maximum_value(numbers, operations)
end
