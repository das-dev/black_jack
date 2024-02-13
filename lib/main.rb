# frozen_string_literal: true

require_relative "controller"
require_relative "game"
require_relative "screen"

class Application
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

  private

  def process_input
    @controller.process_input
  end

  def update
    @game.update
  end

  def render
    @presentation.render
  end
end

Application.new.run if __FILE__ == $PROGRAM_NAME
