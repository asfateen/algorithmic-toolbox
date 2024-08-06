# Calculates the minimum number of coins needed to make change for a given amount.
#
def get_change(n)
  denominations = [1, 5, 10]
  f = Array.new(n + 1, Float::INFINITY)
  f[0] = 0

  (1..n).each do |i|
    denominations.each do |coin|
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
