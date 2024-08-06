
def pisanoPeriod(m)
  previous, current = 0, 1
  (0...m * m).each do |i|
    previous, current = current, (previous + current) % m
    return (i + 1) if previous == 0 && current == 1
  end

end

def fib_last_digit_of_sum(n)
  n = n % pisanoPeriod(10)
  return n if n == 0 || n == 1
  f=[] * (n+1)
  f[0]=0
  f[1]=1
  (2..n).each {|i|
     f[i] = (f[i - 1] + f[i - 2]) % 10}
  f.sum % 10
end

if __FILE__ == $0
  n = gets.to_i
  puts "#{fib_last_digit_of_sum(n)}"
end
