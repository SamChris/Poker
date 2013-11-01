require 'rspec'
require 'poker.rb'

# Card
describe Card do
  subject(:card) { Card.new(:spade,:ace) }

  describe "#suit" do
    its(:suit) { should eq (:spade) }
  end

  describe "#value" do
    its(:value) { should eq (:ace) }
  end
end

# Deck
describe Deck do
  subject(:deck) { Deck.new() }

  describe "#cards" do

    it "has 52 cards" do
      expect(deck.cards.length).to eq (52)
    end

    it "has 13 of spade" do
      expect do
        suit_count = deck.cards.select do |card|
          card.suit == :spade
        end
      end.to eq(13)
    end

    it "has 13 of diamonds" do
      expect do
        suit_count = deck.cards.select do |card|
          card.suit == :diamond
        end
      end.to eq(13)
    end

    it "has 13 of heart" do
      expect do
        suit_count = deck.cards.select do |card|
          card.suit == :heart
        end
      end.to eq(13)
    end

    it "has 13 of club" do
      expect do
        suit_count = deck.cards.select do |card|
          card.suit == :club
        end
      end.to eq(13)
    end

  end

  describe "#deal_hand" do
    it "returns 5 cards" do
      deck.deal.length.should be 5
    end
    it "deck no longer contians dealt cards" do
      deck.cards.length.should be 47
    end
  end


  describe "#shuffle" do
    it "shuffles cards" do
      Deck.new.shuffle == deck {should be_false}
    end
  end
end
# Hand
describe Hand do
  subject(:hand) { Hand.new(Deck.new.deal_hand) }

  describe "#cards" do
    it "has five cards" do
      hand.cards.length.should be 5
    end



     = Card.new(:hearts,:ace)

    it "can be set in initialization" do

  end

  describe "#beat" do
    # The logic of calculating pair, three-of-a-kind, two-pair, etc. goes here.
    # Logic of which hand beats which would go here.
    before do
      init_cards = []
      suits = [:spade,:clubs,:hearts,:diamonds,:clubs,:hearts]
      values = [:seven,:three,:four,:five,:ace]
      5.times do |i|
        init_cards << Card.new(suits[i],values[i])
      end
      hand1 = Hand.new(init_cards)
      suits = [:clubs,:hearts,:diamonds,:clubs,:hearts]
      values = [:ace,:seven,:three,:three,:five]
      init_cards = []
      5.times do |i|
        init_cards << Card.new(suits[i],values[i])
      end
      hand2 = Hand.new(init_cards)
    end
    it "two_pair beats no pair" do
      hand2.beat?(han1).should be true
    end
  end

# Player
describe Player do
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
# Game

describe Game do
  subject(:game) { Game.new }

  describe "#add_players" do
    it "keeps a player array" do
      game.add_players("Daniel", "Jim", "Sam")
      game.players.length.should be(3)
    end

    it "all players are of Player class" do
      game.players.all? do |player|
        player.class == Player
      end.should eq(true)
    end

  describe "#turn" do
    it "keeps a pointer to a player" do
      game.turn.nil?.should be(false)
    end
  end

  describe "#pot" do
    it "keeps tab on the pot" do
      game.pot.class.should be(Fixnum)
    end
  end

end

