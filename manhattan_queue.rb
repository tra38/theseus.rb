require './priority_queue'
require './manhattan_heuristic'

class ManhattanQueue
  attr_reader :queue, :destination_tuple, :teleporter_tuples

  include ManhattanHeuristic

  def initialize(destination_tuple:, teleporter_tuples:)
    @queue = PriorityQueue.new
    @destination_tuple = destination_tuple
    @teleporter_tuples = teleporter_tuples.combination(2)
  end

  def add(element)
    priority = calculate_priority(element, destination_tuple)
    queue.add(element, -priority)
  end

  def pull
    queue.pull
  end

  def empty?
    queue.empty?
  end

  def calculate_priority(element, destination_tuple)
    heuristic(element, destination_tuple)
  end

  def highest_priority
    sorted_hash = queue.hash.sort{|a,b| a[1] <=> b[1]}
    sorted_hash.last
  end

end