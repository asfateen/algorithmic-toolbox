
def pisanoPeriod(m)
  previous, current = 0, 1
  (0...m * m).each do |i|
    previous, current = current, (previous + current) % m
    return (i + 1) if previous == 0 && current == 1
  end

end

def fib_huge(n, m)
  pisano_period = pisanoPeriod(m)
  n = n % pisano_period

  previous, current = 0, 1
    if n == 0
        return 0
    elsif n == 1
        return 1
    end
    (n - 1).times { previous, current = current, previous + current }
    return (current % m)
end

if __FILE__ == $0
  a, b = gets.split().map(&:to_i)
  puts "#{fib_huge(a, b)}"

  puts "pisano of 10 is #{ pisanoPeriod(10)}"
end