# frozen_string_literal: true

require_relative "abc_state"

class WaitForDealerState < AbcState
  def action
    :wait_for_dealer
  end

  def dealer_play
    @game.switch_state(States::WAIT_FOR_PLAYER)
    trigger_state
  end
end
