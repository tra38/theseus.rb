module ManhattanHeuristic
  def heuristic(element, destination)
    normal_route = manhattan_distance(element, destination)

    other_routes = teleporter_tuples.map do |combination|
      determine_teleporter_route_distance(combination, element, destination)
    end

    all_routes = other_routes.push(normal_route)

    all_routes.min { |a, b| a <=> b }
  end

  def manhattan_distance(element_a, element_b)
    (element_a[0] - element_b[0]).abs + (element_a[1] - element_b[1]).abs
  end

  def determine_teleporter_route_distance(combination, element, destination)
    initial_teleporter = combination[0]
    destination_teleporter = combination[1]
    manhattan_distance(element, initial_teleporter) + manhattan_distance(destination_teleporter, destination) + 1
  end

end