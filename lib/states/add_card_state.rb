# frozen_string_literal: true

require_relative "abc_state"

class AddCardState < AbcState
  def action
    :add_card
  end

  def dealer_play
    @game.switch_state(States::WAIT_FOR_DEALER)
    trigger_state
  end
end
