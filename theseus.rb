require_relative 'data_structures'

path_to_maze = ARGV[0]
array_of_arrays = []

unless path_to_maze
  raise "You need to provide a path!"
end

File.foreach(path_to_maze) do |line|
  array_of_arrays << line.chomp.split("")
end

UP_BOUNDARY = 0
DOWN_BOUNDARY = (array_of_arrays.length - 1)
LEFT_BOUNDARY = 0
RIGHT_BOUNDARY = (array_of_arrays[0].length - 1)

dict = { :start => "o", :goal => "*", :tile => ".", :wall => "#", :visited => "X"}

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

  tuples
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

def search(floor_number: floor_number, room_number: room_number, array: array_of_arrays, dict: dict, path: path, structure: structure)
  structure.merge(find_nearby_tuples(floor_number, room_number))

  until structure.empty?
    tuple = structure.remove
    visit_tuple(tuple, structure, array, dict, path) unless path.include? tuple
  end
end

def visit_tuple(tuple, structure, array_of_arrays, dict, path)
  if mark_space(tuple, array_of_arrays, dict, path)

    path << tuple

    floor_number = tuple[0]
    room_number = tuple[1]

    structure.merge(find_nearby_tuples(floor_number, room_number))
  end
end

def mark_space(start_tuple, array_of_arrays, dict, path)

  floor_number = start_tuple[0]
  room_number = start_tuple[1]

  position = array_of_arrays[floor_number][room_number]

  if position == dict[:goal]
    print_movement(start_tuple, array_of_arrays)
    puts "We found the goal! Here's the path we took!"
    p path
    sleep(1)
    false
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


def move_to_goal(start_tuple, array_of_arrays, dict, data_structure_type)

  structure = DataStructure.new(data_structure_type)

  path = []

  floor_number = start_tuple[0]
  room_number = start_tuple[1]
  search(floor_number: floor_number, room_number: room_number, array: array_of_arrays, dict: dict, path: path, structure: structure)
end

p array_of_arrays

start_tuple = search_array(array_of_arrays, dict[:start])

# Depth-First Search
# move_to_goal(start_tuple, array_of_arrays, dict, :stack)

# Breadth-First Search
move_to_goal(start_tuple, array_of_arrays, dict, :queue)