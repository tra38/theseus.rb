require './priority_queue'

RSpec.describe PriorityQueue do
  it "successfully implements a priority queue" do
    queue = PriorityQueue.new
    queue.add("foo", 1)
    queue.add("bar", 3)
    queue.add("baz", 2)

    blank_array = []

    3.times do
      blank_array << queue.pull
    end

    expect(blank_array).to eq(["bar", "baz", "foo"])
  end

  it "declares that a hash is empty when nothing is added" do
    queue = PriorityQueue.new
    expect(queue.empty?).to eq(true)
  end

  it "declares that a hash is not-empty when something is added" do
    queue = PriorityQueue.new
    queue.add("foo", 1)
    expect(queue.empty?).to eq(false)
  end

  it "declares that a hash is empty when something is added and then pulled" do
    queue = PriorityQueue.new
    queue.add("foo", 1)
    queue.pull
    expect(queue.empty?).to eq(true)
  end

  it "allows users to change priority" do
    queue = PriorityQueue.new
    queue.add("foo", 1)
    queue.add("bar", 2)
    queue.add("foo", 3)
    expect(queue.pull).to eq("foo")
  end
end