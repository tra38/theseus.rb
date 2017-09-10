# Queues are FIFO, like a line at a movie theater, the first person to get in is the first person to get out.

# Stacks are LIFO, like a stack of plates. The last plate to get in is the first plate that gets taken.

# PriorityQueues are like queues except that each element also has a priority. The "Manhattan Queue" is a PriorityQueue that assigns priority based on Manhattan distance (in the future, I may need to make an abstract queue that accepts artibrary heuristics).

require_relative 'best_first_queue'
require_relative 'a_star_queue'
class DataStructure
  attr_reader :add, :remove, :add_method, :remove_method, :structure, :priority, :type

  def initialize(type:, start_tuple:,destination_tuple:,teleporter_tuples:)
    @type = type
    case type
    when :stack
      @structure = []
      @add_method = :push #new person comes in line
      @remove_method = :pop #first person leaves line
    when :queue
      @structure = []
      @add_method = :push #new plate gets placed
      @remove_method = :shift #last plate gets taken
    when :best_first
      @structure = BestFirstQueue.new(destination_tuple: destination_tuple, teleporter_tuples: teleporter_tuples)
      @add_method = :add
      @remove_method = :pull
    when :a_star
      @structure = AStarQueue.new(start_tuple: start_tuple, destination_tuple: destination_tuple, teleporter_tuples: teleporter_tuples)
      @add_method = :add
      @remove_method = :pull
    else
      raise "I don't understand this structure!"
    end
  end

  def add(*arguments)
    structure.send(:"#{add_method}", *arguments)
  end

  def remove
    structure.send(:"#{remove_method}")
  end

  def merge(new_array, prior_tuple)
    new_array.each do |element|
      if type == :a_star
        self.add(element, prior_tuple)
      else
        self.add(element)
      end
    end
  end

  def empty?
    structure.empty?
  end
end