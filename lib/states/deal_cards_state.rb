# frozen_string_literal: true

require_relative "abc_state"

class DealCardsState < AbcState
  def action
    :deal_cards
  end

  def dealer_play
    @game.switch_state(States::WAIT_FOR_PLAYER)
    trigger_state
  end
end
