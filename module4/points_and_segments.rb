# Defines a segment with start and end points.
#
Segment = Struct.new("Segment", :a, :b) do
# Checks if the given point is within the segment.
#
  def contains?(point)
    a <= point and point <= b
  end
end
# Counts the number of segments that contain each of the given points.
#
# The algorithm uses an event-based approach where segments' start and end points are treated as events,
# and each point is counted based on the number of active segments at that point.
# (Organizing a lottery)
#
def fast_count_segments(segments, points)
  count = Array.new(points.size, 0)
  point_map = Hash.new { |h, k| h[k] = [] }

  points.each_with_index  do |p, i|
    point_map[p] << i
  end

  events = []

  segments.each do |segment|
    events << [segment.a, :start]
    events << [segment.b, :end]
  end
  
  points.each do |point|
    events << [point, :point]
  end

  events.sort_by! { |x| [x[0], x[1] == :start ? -1 : (x[1] == :end ? 1 : 0)] }


  segments_active = 0
  events.each do |event|
    case event[1]
    when :start
      segments_active += 1
    when :end
      segments_active -= 1
    when :point
      point_map[event[0]].each do |i|
        count[i] = segments_active
      end
    end
  end



  count
end

# Naive approach to improve upon
#
def naive_count_segments(segments, points)
  points.map { |point| segments.count { |s| s.contains?(point) } }
end

if __FILE__ == $0
  data = STDIN.read.split().map(&:to_i)
  s, p = data[0], data[1]
  segments = data[2..2*s+1].each_slice(2).to_a.map { |e| Segment.new(e[0], e[1]) }
  points = data[2*s+2..-1]

  puts fast_count_segments(segments, points).join(' ')
end

