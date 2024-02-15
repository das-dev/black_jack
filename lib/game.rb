# frozen_string_literal: true

require_relative "states/states"
require "forwardable"

class Game
  attr_reader :queue

  extend Forwardable
  def_delegators :state, :action

  def initialize(queue)
    @queue = queue
    @state = States::START_GAME.new(self)
  end

  def switch_state(state)
    # puts "Transitioning from #{self.state.class} to #{state}"
    self.state = state.new(self)
  end

  def update
    while (event = self.event)
      state.method(event).call
    end
  end

  def over?
    false
  end

  def exit?
    action == :exit_game
  end

  protected

  attr_accessor :state

  def event
    queue.pop(true)
  rescue ThreadError
    nil
  end
end
