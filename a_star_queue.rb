require './priority_queue'

class AStarQueue
  attr_reader :queue, :start_tuple, :destination_tuple, :cost_so_far_hash, :came_from

  def initialize(start_tuple:, destination_tuple:)
    @queue = PriorityQueue.new
    @start_tuple = start_tuple
    @cost_so_far_hash = Hash.new(0)
    @destination_tuple = destination_tuple
  end

  def add(element, prior_tuple)
    priority = calculate_priority(element, prior_tuple)
    queue.add(element, -priority)
  end

  def pull
    queue.pull
  end

  def empty?
    queue.empty?
  end

  # f(x) = g(x) + h(x)
  # h(x) is what we already have for Manhattan Queue (a lovely heuristic), but
  # g(x) is the distance from the starting point to today. This is meant to be EXACT!

  def calculate_priority(element, prior_tuple)
    cost_so_far_calculator(element, prior_tuple) + heuristic(element, destination_tuple)
  end

  def cost_so_far_calculator(element, prior_tuple)
    final_cost = cost_so_far_hash[prior_tuple] + 1
    cost_so_far_hash[element] = final_cost
    final_cost
  end

  def heuristic(element, tuple)
    (element[0] - tuple[0]).abs + (element[1] - tuple[1]).abs
  end

  def highest_priority
    sorted_hash = queue.hash.sort{|a,b| a[1] <=> b[1]}
    sorted_hash.last
  end

end