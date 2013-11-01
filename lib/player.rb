require "card"
require "deck"
require "hand"


class Player
  ACTION = { 'f' => :fold, 's' => :see, 'r' => :raise }
  attr_accessor :pot,:hand
  def initialize(pot = 0,hand = nil)
    @pot = pot
    @hand =  hand
  end

  def get_discard
    input = get_user_input
    [Card.new(:ace,:spade),
    Card.new(:two,:diamond),
    Card.new(:five,:club)]
  end

  def get_action
    input = get_user_input
    ACTION[input]
  end
end
