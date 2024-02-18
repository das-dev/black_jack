# frozen_string_literal: true

require_relative "abc_state"

class NewGameState < AbcState
  def action
    :start_game
  end

  def enter
    @game_manager.new_game

    @game_manager.switch_state(States::DEAL_CARDS)
    send_event(:deal_cards)
  end
end
