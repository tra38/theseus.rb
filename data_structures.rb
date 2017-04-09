# Queues are FIFO, like a line at a movie theater, the first person to get in is the first person to get out.

# Stacks are LIFO, like a stack of plates. The last plate to get in is the first plate that gets taken.

# PriorityQueues are like queues except that each element also has a priority. The "Manhattan Queue" is a PriorityQueue that assigns priority based on Manhattan distance (in the future, I may need to make an abstract queue that accepts artibrary heuristics).

require_relative 'manhattan_queue'
class DataStructure
  attr_reader :add, :remove, :add_method, :remove_method, :structure, :priority

  def initialize(type:, start_tuple:)
    case type
    when :stack
      @structure = []
      @add_method = :push #new person comes in line
      @remove_method = :pop #first person leaves line
    when :queue
      @structure = []
      @add_method = :push #new plate gets placed
      @remove_method = :shift #last plate gets taken
    when :manhattan
      @structure = ManhattanQueue.new(start_tuple)
      @add_method = :add
      @remove_method = :pull
    else
      raise "I don't understand this structure!"
    end
  end

  def add(argument)
    structure.send(:"#{add_method}", argument)
  end

  def remove
    structure.send(:"#{remove_method}")
  end

  def merge(new_array)
    new_array.each do |element|
      self.add(element)
    end
  end

  def empty?
    structure.empty?
  end
end