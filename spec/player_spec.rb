require 'rspec'
require 'player.rb'

# Player
describe Player do

  subject(:player) { Player.new(0,nil) }

  describe "#pot" do
    it "is amount of money in on table in fixnum " do
      player.pot.class.should be Fixnum
    end
  end

  describe "#get_discard" do
    it "should get discarded cards" do
      player.stub(:get_user_input).and_return('as,2d,5c')

      expected_cards =[
        Card.new(:ace,:spade),
        Card.new(:two,:diamond),
        Card.new(:five,:club)
      ]
      got_cards = player.get_discard
      match = true
      3.times do |i|
        match = false if expected_cards[i].suit != got_cards[i].suit
        match = false if expected_cards[i].value != got_cards[i].value
      end
      match.should be_true
    end

  end

  describe "#get_action" do
    it "should get player action f => :fold" do
      player.stub(:get_user_input).and_return('f')
      player.get_action.should be :fold
    end
    it "should get player action r => :raise" do
      player.stub(:get_user_input).and_return('r')
      player.get_action.should be :raise
    end
    it "should get player action s => :see" do
      player.stub(:get_user_input).and_return('s')
      player.get_action.should be :see
    end
  end
end

