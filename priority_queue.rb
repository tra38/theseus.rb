class PriorityQueue
  attr_reader :hash

  def initialize
    @hash = Hash.new
  end

  def add(element, priority)
    hash[element] = priority
  end

  def pull
    sorted_array_of_key_value_pairs = hash.sort{|a,b| a[1] <=> b[1]}
    largest_key_value_pair = sorted_array_of_key_value_pairs.last

    if largest_key_value_pair
      largest_key = largest_key_value_pair[0]
      hash.delete(largest_key)

      largest_key
    else
      nil
    end
  end

  def empty?
    hash.empty?
  end

end