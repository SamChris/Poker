require 'rspec'
require 'poker.rb'
require "game"


describe Game do
  subject(:game) { Game.new }

  describe "#add_players" do
    it "keeps a player array" do
      game.add_players(["Daniel", "Jim", "Sam"])
      game.players.length.should be(3)
    end
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

