require "card"
require "deck"
require "hand"
require "player"

class Game
  attr_accessor :players, :turn, :pot

  def initialize
    @players = []
    @turn = 0
    @pot = 0
  end

  def add_players names
    names.each {|n| @players << n}
  end

end
