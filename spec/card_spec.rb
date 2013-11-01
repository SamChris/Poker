require 'rspec'
require 'card.rb'

# Card
describe Card do
  subject(:card) { Card.new(:ace,:spade) }

  describe "#suit" do
    its(:suit) { should eq (:spade) }
  end

  describe "#value" do
    its(:value) { should eq (:ace) }
  end
end

