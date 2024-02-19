# frozen_string_literal: true

require_relative "controller"
require_relative "game_manager"
require_relative "screen"

require "forwardable"

class GameLoop
  extend Forwardable
  def_delegators :@presentation, :render
  def_delegators :@game_manager, :update

  def initialize
    @queue = Queue.new
    @game_manager = GameManager.new(@queue, debug: debug?)
    @controller = Controller.new(@queue)
    @presentation = Screen.new(debug: debug?)
  end

  def run
    until @game_manager.exit?
      process_input
      update
      render
    end
  end

  private

  def process_input
    @controller.process_input(@game_manager.events_map)
  end

  def render
    @presentation.render(@game_manager.context)
  end

  def debug?
    ARGV.include?("--debug")
  end
end

GameLoop.new.run if __FILE__ == $PROGRAM_NAME
