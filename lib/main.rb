# frozen_string_literal: true

require_relative "controller"
require_relative "game_manager"
require_relative "screen"

require "forwardable"

class GameLoop
  extend Forwardable
  def_delegators :@presentation, :render
  def_delegators :@game_manager, :update

  def initialize(params)
    @options = parse_params(params)
    @queue = Queue.new
    @game_manager = GameManager.new(@queue, debug: @options[:debug])
    @controller = Controller.new(@queue)
    @presentation = Screen.new(@game_manager.action, debug: @options[:debug])
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
    @presentation.render(@game_manager.action, @game_manager.context)
  end

  def parse_params(params)
    options = { debug: params.include?("--debug") }
    params.clear
    options
  end
end

GameLoop.new(ARGV).run if __FILE__ == $PROGRAM_NAME
