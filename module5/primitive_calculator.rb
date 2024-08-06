# Finds the minimum sequence of operations to reach a number `n` starting from 1.
#
# The function computes the sequence of operations required to reach the number `n` using the minimum number of steps.
# The allowed operations are adding 1, multiplying by 2, and multiplying by 3.
# The function uses dynamic programming to build up the solution from smaller subproblems.
#
def minimum_operations(n)
  answer = Array.new(n + 1, [])
  answer[0] = []
  answer[1] = [1]
  answer[2] = [1, 2]
  answer[3] = [1, 3]
(4..n).each do |i|
  min_operations = answer[i - 1] + [i]
  
  if i % 3 == 0
    operations_by_3 = answer[i / 3] + [i]
    min_operations = operations_by_3 if operations_by_3.length < min_operations.length
  end

  if i % 2 == 0
    operations_by_2 = answer[i / 2] + [i]
    min_operations = operations_by_2 if operations_by_2.length < min_operations.length
  end

  answer[i] = min_operations


end
answer[n]

end

if __FILE__ == $0
  n = gets.to_i
  answer = minimum_operations(n)
  puts answer.length - 1
  puts answer.join(' ')
end