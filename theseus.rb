require_relative 'data_structures'
require 'pry'

path_to_maze = ARGV[0]
array_of_arrays = []

unless path_to_maze
  raise "You need to provide a path!"
end

File.foreach(path_to_maze) do |line|
  array_of_arrays << line.chomp.split("")
end

FINAL_MAP = Marshal.load(Marshal.dump(array_of_arrays))

UP_BOUNDARY = 0
DOWN_BOUNDARY = (array_of_arrays.length - 1)
LEFT_BOUNDARY = 0
RIGHT_BOUNDARY = (array_of_arrays[0].length - 1)

dict = { :start => "o", :goal => "*", :tile => ".", :wall => "#", :visited => "X", :teleport => "@"}

def search_array(array_of_arrays, target_element)
  array_of_arrays.each_with_index do |array, floor_number|
    array.each_with_index do |element, room_number|
      if element == target_element
        return [floor_number, room_number]
      end
    end
  end
  return nil
end

def deep_search_array(array_of_arrays, target_element)
  output_array = []
  array_of_arrays.each_with_index do |array, floor_number|
    array.each_with_index do |element, room_number|
      if element == target_element
        output_array << [floor_number, room_number]
      end
    end
  end
  output_array
end

def find_nearby_tuples(floor_number, room_number)

  tuples = []

  if floor_number > UP_BOUNDARY
    tuples << [floor_number - 1, room_number]
  end

  if floor_number < DOWN_BOUNDARY
    tuples << [floor_number + 1, room_number]
  end

  if room_number > LEFT_BOUNDARY
    tuples << [floor_number, room_number - 1]
  end

  if room_number < RIGHT_BOUNDARY
    tuples << [floor_number, room_number + 1]
  end

  if found_teleporter?(FINAL_MAP, floor_number, room_number)
    deep_search_array(FINAL_MAP, "@").each do |candidate_tuple|

      unless (candidate_tuple[0] == floor_number && candidate_tuple[1] == room_number)
        tuples << candidate_tuple
      end
    end
  end

  tuples
end

def found_teleporter?(final_map, floor_number, room_number)
  deep_search_array(FINAL_MAP, "@").each do |candidate_tuple|
    if (candidate_tuple[0] == floor_number && candidate_tuple[1] == room_number)
      return true
    end
  end

  return false
end

def print_movement(start_tuple, array_of_arrays)

  floor_number = start_tuple[0]
  room_number = start_tuple[1]

  deep_clone = Marshal.load( Marshal.dump(array_of_arrays) )

  deep_clone[floor_number][room_number] = "💻"

  print "\e[2J\e[f"

  deep_clone.each do |array|
    puts array.join("")
  end
  sleep(1)
end

def print_final_map(final_array, final_map, dict)

  final_array.each do |tuple|
    floor_number = tuple[0]
    room_number = tuple[1]

    position = final_map[floor_number][room_number]

    unless (position == dict[:wall] || position == dict[:visited] || position == dict[:start] || position == dict[:goal] || position == dict[:teleport])
      final_map[floor_number][room_number] = "X"
    end
  end

  print "\e[2J\e[f"

  puts "We found the goal! Here's the path we took!"

  final_map.each do |array|
    puts array.join("")
  end
end

def search(floor_number:, room_number:, array:, dict:, path:, structure:)
  structure.merge(find_nearby_tuples(floor_number, room_number), [floor_number, room_number])

  until structure.empty?
    tuple = structure.remove
    visit_tuple(tuple, structure, array, dict, path)
  end
end

def visit_tuple(tuple, structure, array_of_arrays, dict, path)
  if mark_space(tuple, array_of_arrays, dict, path)

    floor_number = tuple[0]
    room_number = tuple[1]

    structure.merge(find_nearby_tuples(floor_number, room_number), tuple)

    mark_tuples(tuple, path)
  end
end

def mark_tuples(tuple, path)
  floor_number = tuple[0]
  room_number = tuple[1]

  find_nearby_tuples(floor_number, room_number).each do |new_tuple|
    unless path.include? new_tuple
      path[new_tuple] = tuple
    end
  end
end

def mark_space(start_tuple, array_of_arrays, dict, path)

  floor_number = start_tuple[0]
  room_number = start_tuple[1]

  position = array_of_arrays[floor_number][room_number]

  if position == dict[:goal]
    print_movement(start_tuple, array_of_arrays)

    starting_point = search_array(array_of_arrays, dict[:start])

    recursive_print(path, start_tuple, [], starting_point, dict)
    sleep(1)
    abort
  elsif (position == dict[:wall] || position == dict[:visited] || position == dict[:start])
    false
  else
    # mark that it has been completed
    array_of_arrays[floor_number][room_number] = "X"

    # print the movement
    print_movement(start_tuple, array_of_arrays)
    true
  end
end

def recursive_print(path, start_tuple, final_array, starting_point, dict)
  final_array << start_tuple
  if starting_point == start_tuple
    print_final_map(final_array, FINAL_MAP, dict)
    p final_array
    puts "Tiles Explored: #{path.keys.count}"
    puts "Length of Path: #{final_array.count}"
  else
    previous_tuple = path[start_tuple]
    recursive_print(path, previous_tuple, final_array, starting_point, dict)
  end
end

def move_to_goal(start_tuple, array_of_arrays, dict, data_structure_type)

  structure = create_structure(data_structure_type: data_structure_type, array_of_arrays: array_of_arrays, dict: dict)

  path = Hash.new

  path[start_tuple] = nil

  mark_tuples(start_tuple, path)

  floor_number = start_tuple[0]
  room_number = start_tuple[1]
  search(floor_number: floor_number, room_number: room_number, array: array_of_arrays, dict: dict, path: path, structure: structure)
end

def create_structure(data_structure_type:,array_of_arrays:,dict:)
  start_tuple = search_array(array_of_arrays, dict[:start])
  destination_tuple = search_array(array_of_arrays, dict[:goal])

  teleporter_tuples = deep_search_array(FINAL_MAP, "@")

  DataStructure.new(type: data_structure_type, start_tuple: start_tuple, destination_tuple: destination_tuple, teleporter_tuples: teleporter_tuples)
end


p array_of_arrays

start_tuple = search_array(array_of_arrays, dict[:start])

# Depth-First Search
# move_to_goal(start_tuple, array_of_arrays, dict, :stack)

# Breadth-First Search
# move_to_goal(start_tuple, array_of_arrays, dict, :queue)

# Manhattan-First Search
move_to_goal(start_tuple, array_of_arrays, dict, :manhattan)

#A-Star Search
# move_to_goal(start_tuple, array_of_arrays, dict, :a_star)
