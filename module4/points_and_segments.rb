
Segment = Struct.new("Segment", :a, :b) do
  def contains?(point)
    a <= point and point <= b
  end
end

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

