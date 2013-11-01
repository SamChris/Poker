require 'rspec'
require 'player.rb'

# Player
describe Player do
   suits = [:spade,:clubs,:hearts,:diamonds,:clubs,:hearts]
   values = [:seven,:three,:four,:five,:ace]
   5.times do |i|
     Card.stub(:new).and_return([suits[i],values[i]])
     init_cards << Card.new
   end




  and.stub(:new)and_return()
  subject(:player) { Player.new(Hand.new(Deck.new.deal_hand)) }

  describe "#pot" do
    it "is amount of money in on table in fixnum " do
      player.wallet.class.should be Fixnum
    end
  end

  describe "#hand" do
    it "player has hand " do
      player.hand.class.should be Hand
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
      player.get_discard.should be expected_cards
    end
    it "hand should be modified" do
      player.hand.cards.length.should be 2
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

