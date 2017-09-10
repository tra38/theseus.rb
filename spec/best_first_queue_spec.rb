require './best_first_queue'

RSpec.describe BestFirstQueue do
  it "calculates priority correctly" do
    destination_tuple = [100, 100]
    start_tuple = [0,0]
    teleporter_tuples = []
    queue = BestFirstQueue.new(destination_tuple: destination_tuple, teleporter_tuples: teleporter_tuples)
    queue.add(start_tuple)
    expect(queue.highest_priority).to eq([[0,0], -200])
  end
end