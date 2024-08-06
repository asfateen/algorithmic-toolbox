# Computes the minimum number of coins needed to make up a given amount.
# This method calculates the minimum number of coins required to make up
# the specified amount using a dynamic programming approach.
#
def change(amount)
  denominations = [1, 3, 4]
  f = Array.new(amount + 1, Float::INFINITY)
  f[0] = 0

  (1..amount).each do |i|
    denominations.each do |coin|
      if coin <= i
        f[i] = [f[i], f[i - coin] + 1].min
      end
    end
  end

  f[amount] == Float::INFINITY ? -1 : f[amount]

  return f[amount]
end

if __FILE__ == $0
  m = gets.to_i
  puts change(m)
end
