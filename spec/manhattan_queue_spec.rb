require './manhattan_queue'

RSpec.describe ManhattanQueue do
  it "calculates priority correctly" do
    destination_tuple = [100, 100]
    start_tuple = [0,0]
    queue = ManhattanQueue.new(destination_tuple)
    queue.add(start_tuple)
    expect(queue.highest_priority).to eq([[0,0], -200])
  end
end