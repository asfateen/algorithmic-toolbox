# Represents a segment with a start and end point.
#
Segment = Struct.new("Segment", :start, :end)

# Determines the optimal points that cover all given segments.
#
# This function computes the minimum number of points required to cover all the given segments.
# It returns these points using a greedy algorithm approach
#
# @example
#   segments = [Segment.new(1, 3), Segment.new(2, 5), Segment.new(4, 6)]
#   optimal_points(segments) # => [3, 6]
#
def optimal_points(segments)
  points = []
  return points if segments.empty?
  segments.sort_by! {|segment| segment.end}
  point = segments[0].end
  points << point
  (0...segments.size).each do |i|
    if (point < segments[i].start || point > segments[i].end)
      point = segments[i].end
      points << point
    end
  end
  
  points
end

if __FILE__ == $0
  data = STDIN.read.split().map(&:to_i)
  n = data[0]
  segments = data[1..2*n].each_slice(2).to_a.map { |e| Segment.new(e[0], e[1]) }
  points = optimal_points(segments)
  puts "#{points.size}"
  puts "#{points.join(' ')}"
end