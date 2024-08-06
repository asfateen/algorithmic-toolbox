
Segment = Struct.new("Segment", :start, :end)

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