piles = Array.new(11) { Array.new(11) }
piles[0] = [nil, :W, :W, :W]
piles[1] = [:W, :W, :W, :L]
piles[2] = [:W, :W, :L]
piles[3] = [:W, :L]

(0..10).each do |i|
  (0..10).each do |j|
    next if i == 0 && j == 0
    unless piles[i][j]
      if (j >= 1 && piles[i][j - 1] == :L) || (j >= 2 && piles[i][j - 2] == :L) || (j >= 3 && piles[i][j - 3] == :L) ||
         (i >= 1 && piles[i - 1][j] == :L) || (i >= 1 && j >= 1 && piles[i - 1][j - 1] == :L) || (i >= 1 && j >= 2 && piles[i - 1][j - 2] == :L) ||
         (i >= 2 && piles[i - 2][j] == :L) || (i >= 2 && j >= 1 && piles[i - 2][j - 1] == :L) || (i >= 3 && piles[i - 3][j] == :L)
        
        piles[i][j] = :W
      else
        piles[i][j] = :L
      end
    end
  end
end

puts "  " + (0..10).to_a.join(" ")
piles.each_with_index do |row, i|
  print " " unless i == 10
  puts i.to_s + " " + row.map { |cell| cell.nil? ? " " : cell.to_s }.join(" ")
end