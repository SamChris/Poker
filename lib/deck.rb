require "card"

class Deck
  attr_accessor :cards
  CARD_VALUES = [
    :two,
    :three,
    :four,
    :five,
    :six,
    :seven,
    :eight,
    :nine,
    :ten,
    :jack,
    :queen,
    :king,
    :ace
  ]
  SUIT_VALUES = [
    :spade,
    :club,
    :diamond,
    :heart
  ]
  def initialize
    @cards = build_deck
  end

  def build_deck
    cards = []
    SUIT_VALUES.each do |suit|
      CARD_VALUES.each do |val|
        cards << Card.new(val,suit)
      end
    end

    cards
  end

  def deal
    hand = []
    5.times {hand << self.cards.pop }
    hand
  end

  def shuffle
    self.cards.shuffle!
  end
end