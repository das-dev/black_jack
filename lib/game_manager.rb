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
  def_delegators :state, :action, :events_map

  def initialize(queue, debug: false)
    @debug = debug
    @queue = queue
    @game = nil
    @state = make_state(States::NEW_GAME)
  end

  def context
    return if @game.nil?

    context = Struct.new(:game_bank, :dealer_bank, :player_bank)
    context.new(@game.bank.balance, @game.player.balance, @game.dealer.balance)
  end

  def switch_state(state)
    @state = make_state(state)
  end

  def update
    while (action = next_action)
      state.process_action(action)
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

  def next_action
    queue.pop(true)
  rescue ThreadError
    nil
  end

  private

  def make_state(state)
    puts "Transitioning from #{self.state.class} to #{state}" unless @debug
    state.new(self, @game)
  end
end
