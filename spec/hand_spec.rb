require 'rspec'
require 'hand.rb'

describe Hand do
  describe "#cards" do
    init_cards = []
    suits = [:spade,:clubs,:hearts,:diamonds,:clubs,:hearts]
    values = [:seven,:three,:four,:five,:ace]
    5.times do |i|
      Card.stub(:new).and_return([suits[i],values[i]])
      init_cards << Card.new
    end
    hand1 = Hand.new(init_cards)
    it "has five cards" do
      hand1.cards.length.should be 5
    end
  end

  describe "#beat" do
    # The logic of calculating pair, three-of-a-kind, two-pair, etc. goes here.
    # Logic of which hand beats which would go here.
    before do
      init_cards = []
      suits = [:spade,:clubs,:hearts,:diamonds,:clubs,:hearts]
      values = [:seven,:three,:four,:five,:ace]
      5.times do |i|
        Card.stub(:new).and_return([suits[i],values[i]])
        init_cards << Card.new
      end
      hand1 = Hand.new(init_cards)
      suits = [:clubs,:hearts,:diamonds,:clubs,:hearts]
      values = [:ace,:seven,:three,:three,:five]
      init_cards = []
      5.times do |i|
        Card.stub(:new).and_return([suits[i],values[i]])
        init_cards << Card.new
      end
      hand2 = Hand.new(init_cards)
    end
    it "two_pair beats no pair" do
      # Card.stub(:suit).and_return(self[])
  #     Card.stub(:suit).and_return(self[1])
      hand2.beat?(hand1).should be true
    end
  end

