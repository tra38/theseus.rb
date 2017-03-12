# Queues are FIFO, like a line at a movie theater, the first person to get in is the first person to get out.

# Stacks are LIFO, like a stack of plates. The last plate to get in is the first plate that gets taken.

class DataStructure
  attr_reader :add, :remove, :add_method, :remove_method, :structure
  def initialize(type)
    @structure = []
    if type == :stack
      @add_method = :push #new person comes in line
      @remove_method = :pop #first person leaves line
    elsif type == :queue
      @add_method = :push #new plate gets placed
      @remove_method = :shift #last plate gets taken
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
end