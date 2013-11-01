require 'rspec'
require 'hand.rb'
require 'card.rb'

describe Hand do
  describe "#cards" do
    init_cards = []
    suits = [:spade,:clubs,:hearts,:diamonds,:clubs,:hearts]
    values = [:seven,:three,:four,:five,:ace]
    5.times do |i|
      init_cards << Card.new(values[i],suits[i])
    end
    hand1 = Hand.new(init_cards)
    it "has five cards" do
      hand1.cards.length.should be 5
    end
  end

  describe "#beat" do
    it "two_pair beats no pair" do
      init_cards = []
      suits = [:spade,:clubs,:hearts,:diamonds,:clubs,:hearts]
      values = [:seven,:three,:four,:five,:ace]
      5.times do |i|
        init_cards << Card.new(values[i],suits[i])
      end
      hand1 = Hand.new(init_cards)
      suits = [:clubs,:hearts,:diamonds,:clubs,:hearts]
      values = [:ace,:seven,:three,:three,:five]
      init_cards = []
      5.times do |i|
        init_cards << Card.new(values[i],suits[i])
      end
      hand2 = Hand.new(init_cards)
      hand2.beat?(hand1).should be true
    end
  end
end

