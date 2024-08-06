# Calculates the minimum number of refills required to travel a distance with a given range and stops.
#
# This function determines the minimum number of refills needed to travel a distance `d` with a vehicle
# that has a maximum range `m` between refills. It uses a list of available stops to decide where to refill.
#
def min_refills(d, m, stops)
  return 0 if d <= m

  distance_thus_far = 0
  refills = 0

  while distance_thus_far + m < d
    reachable_stops = stops.select { |distance| distance - distance_thus_far <= m }
    return -1 if reachable_stops.empty?

    distance_thus_far = reachable_stops.max
    refills += 1

    stops = stops.drop_while { |distance| distance <= distance_thus_far }
  end
  refills
end


if __FILE__ == $0
  d = gets.to_i
  m = gets.to_i
  n = gets.to_i
  stops = gets.split.map(&:to_i)
  puts min_refills(d, m, stops)
end
