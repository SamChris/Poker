require 'rspec'
require 'deck.rb'
require 'card.rb'

# Deck
describe Deck do
  subject(:deck) { Deck.new() }
  describe "#cards" do

    it "has 52 cards" do
      deck.cards.length.should be 52
    end

    it "has 13 of spade" do
        cards = deck.cards.select do |card|
          card.suit == :spade
        end
        cards.length.should be 13
    end

    it "has 13 of diamonds" do
      cards = deck.cards.select do |card|
        card.suit == :diamond
      end
      cards.length.should be 13
    end

    it "has 13 of heart" do
      cards = deck.cards.select do |card|
        card.suit == :heart
      end
      cards.length.should be 13
    end

    it "has 13 of club" do
      cards = deck.cards.select do |card|
        card.suit == :club
      end
      cards.length.should be 13
    end

  end

  describe "#deal_hand" do

    it "returns 5 cards" do
      deck.deal.length.should be 5
    end
    it "deck no longer contains dealt cards" do
      deck.deal
      deck.cards.length.should be 47
    end
  end


  describe "#shuffle" do
    it "shuffles cards" do
      Deck.new.shuffle == deck {should be_false}
    end
  end
end
