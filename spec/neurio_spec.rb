require 'neurio'

RSpec.describe Neurio do
  describe "#initialize" do
    it "should raise an ArgumentError error if no parameters passed" do
      expect { Neurio.new }.to raise_error(ArgumentError)
    end
  end
end
