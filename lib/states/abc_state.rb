# frozen_string_literal: true

class AbcState
  def initialize(game)
    @game = game
  end

  def exit_game
    @game.switch_state(States::EXIT_GAME)
    trigger_state
  end

  def trigger_state
    @game.queue << :dealer_play
  end

  def dealer_play; end
end
