Point = Struct.new(:x, :y)

def min(a, b)
  a < b ? a : b
end

def euclidean_distance(p1, p2)
  Math.sqrt((p1.x - p2.x)**2 + (p1.y - p2.y)**2)
end

def minimum_distance(points)
  n = points.length
  return Float::INFINITY if n <= 1

  mid = n / 2
  left = points[0...mid]
  right = points[mid...n]
  d1 = minimum_distance(left)
  d2 = minimum_distance(right)
  d= min(d1, d2)
  mid_x = points[mid].x
  in_strip = points.select { |point| (point.x - mid_x).abs < d }
  in_strip.sort_by!(&:y)

  d_ = Float::INFINITY
  (0...in_strip.length).each do |i|
    (i + 1...min(i + 7, in_strip.length)).each do |j|
      d_ = min(d_, euclidean_distance(in_strip[i], in_strip[j]))
    end
  end
  min(d,d_)
end

if __FILE__ == $0
  data = STDIN.read.split().map(&:to_i)
  n = data.size - 1
  x = (1..n).step(2).map { |i| data[i] }
  y = (2..n).step(2).map { |i| data[i] }

  points = x.zip(y).map { |x, y| Point.new(x, y) }
  points.sort_by!(&:x)
  puts "#{'%.4f' % minimum_distance(points)}"
end