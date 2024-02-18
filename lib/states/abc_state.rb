# frozen_string_literal: true

class AbcState
  def initialize(game_manager, game)
    @game_manager = game_manager
    @game = game
  end

  def quit
    @game_manager.switch_state(States::QUIT)
    send_event(:do_nothing)
  end

  def send_event(event)
    @game_manager.queue << event
  end

  def do_nothing; end
end
