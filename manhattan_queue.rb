require './priority_queue'
require 'pry'

class ManhattanQueue
  attr_reader :queue, :destination_tuple
  def initialize(destination_tuple)
    @queue = PriorityQueue.new
    @destination_tuple = destination_tuple
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
    (element[0] - destination_tuple[0]).abs + (element[1] - destination_tuple[1]).abs
  end

  def highest_priority
    sorted_hash = queue.hash.sort{|a,b| a[1] <=> b[1]}
    sorted_hash.last
  end

end