# frozen_string_literal: true

class Player
  attr_reader :hand

  def initialize(bank)
    @hand = []
    @bank = bank
  end

  def balance
    @bank.balance
  end

  def add_card(card)
    hand << card
  end

  def bet(amount, game_bank)
    bank.withdraw(amount)
    game_bank.deposit(amount)
  end

  def full?
    hand.size == 3
  end
end
