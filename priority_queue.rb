class PriorityQueue
  attr_reader :hash

  def initialize
    @hash = Hash.new
  end

  def add(element, priority)
    hash[element] = priority
  end

  def pull
    if empty?
      raise "PriorityQueue is empty"
    else
      sorted_array_of_key_value_pairs = hash.sort{|a,b| a[1] <=> b[1]}
      largest_key_value_pair = sorted_array_of_key_value_pairs.last
      largest_key = largest_key_value_pair[0]
      hash.delete(largest_key)

      largest_key
    end
  end

  def empty?
    hash.empty?
  end

end