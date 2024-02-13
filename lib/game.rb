# frozen_string_literal: true

require_relative "states"

class Game
  attr_reader :queue
  attr_accessor :state

  def initialize(queue)
    @queue = queue
    @state = StartGameState.new(self)
  end

  def update
    while (event = @queue.pop)
      event.call(self)
    end
  end

  def user_play(action)
    @state.user_play(action)
  end

  def dealer_play
    @state.dealer_play
  end

  def action
    @state.action
  end

  def over?
    false
  end

  def exit?
    action == :exit_game
  end
end
