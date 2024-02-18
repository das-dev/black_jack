# frozen_string_literal: true

require_relative "abc_state"

class WaitForPlayerState < AbcState
  def action
    :wait_for_player
  end

  def pass_turn
    @game_manager.switch_state(States::WAIT_FOR_DEALER)
    send_event(:wait_for_dealer)
  end

  def add_card
    return if @game.player_full?

    @game.add_card_to_player

    @game_manager.switch_state(States::WAIT_FOR_DEALER)
    send_event(:wait_for_dealer)
  end

  def open_cards
    @game_manager.switch_state(States::WAIT_FOR_DEALER)
    send_event(:wait_for_dealer)
  end
end
