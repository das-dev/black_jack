# frozen_string_literal: true

require_relative "states"
require "forwardable"

class Game
  attr_reader :queue
  attr_accessor :state

  extend Forwardable
  def_delegators :@state, :action, :user_play, :dealer_play

  def initialize(queue)
    @queue = queue
    @state = StartGameState.new(self)
  end

  def update
    while (event = self.event)
      event.call(self)
    end
  end

  def over?
    false
  end

  def exit?
    action == :exit_game
  end

  protected

  def event
    @queue.pop(true)
  rescue ThreadError
    nil
  end
end
