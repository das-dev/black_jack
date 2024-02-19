# frozen_string_literal: true

require_relative "abc_state"

class WaitForDealerState < AbcState
  def action
    :wait_for_dealer
  end

  def wait_for_dealer
    @game_manager.switch_state(States::WAIT_FOR_PLAYER)
    send_event(:do_nothing)
  end
end
