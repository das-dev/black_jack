# frozen_string_literal: true

require_relative "controller"
require_relative "game"
require_relative "screen"
require "forwardable"

class GameLoop
  extend Forwardable
  def_delegators :@presentation, :render
  def_delegators :@game, :update
  def_delegators :@controller, :process_input

  def initialize
    @queue = Queue.new
    @game = Game.new(@queue)
    @controller = Controller.new(@queue)
    @presentation = Screen.new(@game)
  end

  def run
    until @game.over? || @game.exit?
      process_input
      update
      render
    end
  end
end

GameLoop.new.run if __FILE__ == $PROGRAM_NAME
