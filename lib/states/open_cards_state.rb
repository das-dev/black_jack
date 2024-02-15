# frozen_string_literal: true

require_relative "abc_state"

class OpenCardsState < AbcState
  def action
    :open_cards
  end

  def dealer_play
    @game.switch_state(States::WAIT_FOR_DEALER)
    trigger_state
  end
end
