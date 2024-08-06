DENOMINATIONS = [1, 5, 10]
def get_change(n)
  f = Array.new(n + 1, Float::INFINITY)
  f[0] = 0

  (1..n).each do |i|
    DENOMINATIONS.each do |coin|
      if coin <= i
        f[i] = [f[i], f[i - coin] + 1].min
      end
    end
  end

  f[n] == Float::INFINITY ? -1 : f[n]
end


if __FILE__ == $0
  n = gets.to_i
  puts "#{get_change(n)}"   
end
