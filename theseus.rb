require 'pry'

array_of_arrays = []

File.foreach("maze.txt") do |line|
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
    tuples << { direction: :up, tuple: [floor_number - 1, room_number] }
  end

  if floor_number < DOWN_BOUNDARY
    tuples << { direction: :down, tuple: [floor_number + 1, room_number] }
  end

  if room_number > LEFT_BOUNDARY
    tuples << { direction: :left, tuple: [floor_number, room_number - 1] }
  end

  if room_number < RIGHT_BOUNDARY
    tuples << { direction: :right, tuple: [floor_number, room_number + 1] }
  end

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

def depth_first_search(floor_number, room_number, array_of_arrays, dict, path)
  nearby_tuples = find_nearby_tuples(floor_number, room_number)

  if nearby_tuples
    nearby_tuples.each do |tuple_hash|
      tuple = tuple_hash[:tuple]
      unless path.include? tuple
        new_path = path.dup
        move_to_goal(tuple, array_of_arrays, dict, new_path)
      end
    end
  end
end


def move_to_goal(start_tuple, array_of_arrays, dict, path=[])

  floor_number = start_tuple[0]
  room_number = start_tuple[1]

  path << start_tuple

  position = array_of_arrays[floor_number][room_number]

  if position == dict[:goal]
    print_movement(start_tuple, array_of_arrays)
    puts "We found the goal! Here's the path we took!"
    p path
  elsif (position == dict[:wall] || position == dict[:visited])
    false
  else
    # mark that it has been completed
    array_of_arrays[floor_number][room_number] = "X"

    # print the movement
    print_movement(start_tuple, array_of_arrays)

    # do depth_first_search
    depth_first_search(floor_number, room_number, array_of_arrays, dict, path)
  end
end

p array_of_arrays

start_tuple = search_array(array_of_arrays, dict[:start])

move_to_goal(start_tuple, array_of_arrays, dict)