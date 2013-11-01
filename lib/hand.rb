
class Hand
  attr_accessor :cards
  def initialize(cards)
    @cards = cards
  end

  def beat?(other_hand)
    return true if self.has_pair? && !other_hand.has_pair?
    return false if !self.has_pair? && other_hand.has_pair?
    raise DrawException, "equal hand strength"
  end

  def has_pair?
    self.cards.map { |card| card.value}.uniq.length < 5
  end
end