# frozen_string_literal: true

require_relative "states/states"

require_relative "game/bank"
require_relative "game/deck"
require_relative "game/game"
require_relative "game/player"

require "forwardable"

class GameManager
  attr_reader :queue, :state

  extend Forwardable
  def_delegators :state, :action

  def initialize(queue)
    @queue = queue
    @state = nil
    @game = nil

    switch_state(States::NEW_GAME)
  end

  def switch_state(state)
    puts "Transitioning from #{self.state.class} to #{state}"
    @state = state.new(self, @game)
  end

  def update
    while (event = self.event)
      state.method(event).call
    end
  end

  def new_game
    @game = Game.new(
      player: Player.new(Bank.new(Game::BANK_SIZE)),
      dealer: Player.new(Bank.new(Game::BANK_SIZE)),
      deck: Deck.new,
      bank: Bank.new
    )
  end

  def exit?
    action == :quit
  end

  protected

  def event
    queue.pop(true)
  rescue ThreadError
    nil
  end
end
