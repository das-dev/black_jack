# frozen_string_literal: true

require_relative "abc_state"

class WaitForDealerState < AbcState
  def action
    :wait_for_dealer
  end

  def wait_for_dealer
    if @game.player_full?
      @game.add_card_to_dealer unless @game.dealer_full?
      @game_manager.switch_state(States::REVEAL_CARDS)
      send_event(:reveal)
    else
      @game_manager.switch_state(States::WAIT_FOR_PLAYER)
      send_event(:do_nothing)
    end
  end
end
