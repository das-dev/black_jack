# frozen_string_literal: true

require_relative "abc_state"

class StartGameState < AbcState
  def action
    :start_game
  end

  def enter
    @game.switch_state(States::DEAL_CARDS)
    trigger_state
  end
end
