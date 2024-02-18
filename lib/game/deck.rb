# frozen_string_literal: true

class Deck
  attr_reader :cards

  def initialize
    @cards = (1..10).to_a * 4
    @cards.shuffle!
  end

  def deal_card
    cards.pop
  end
end
