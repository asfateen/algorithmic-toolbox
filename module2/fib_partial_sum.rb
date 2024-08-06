def pisanoPeriod(m)
  previous, current = 0, 1
  (m * m).times do |i|
    previous, current = current, (previous + current) % m
    return (i + 1) if previous == 0 && current == 1
  end
end

def fib_partial_sum(m, n)
  m_pisano = pisanoPeriod(10)
  n_pisano = pisanoPeriod(10)
  
  m = m % m_pisano
  n = n % n_pisano
  
  if n < m
    n += m_pisano
  end

  f = [0, 1]
  (2..n).each { |i| f[i] = (f[i - 1] + f[i - 2]) % 10 }

  sum = f[m..n].sum % 10
  return sum
end

if __FILE__ == $0
  m, n = gets.split.map(&:to_i)
  puts "#{fib_partial_sum(m, n)}"
end
