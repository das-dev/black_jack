# frozen_string_literal: true

class Game
  attr_accessor :player, :dealer, :deck, :bank

  BANK_SIZE = 100

  def initialize(player:, dealer:, bank:, deck:)
    @player = player
    @dealer = dealer
    @deck = deck
    @bank = bank
  end

  def deal_cards
    2.times do
      add_card_to_player
      add_card_to_dealer
    end
  end

  def place_bet
    @player.bet(10, @bank)
    @dealer.bet(10, @bank)
  end

  def add_card_to_player
    @player.add_card(@deck.deal_card)
  end

  def add_card_to_dealer
    @dealer.add_card(@deck.deal_card)
  end

  def player_full?
    @player.full?
  end

  def dealer_full?
    @dealer.full?
  end
end
