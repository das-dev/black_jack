# frozen_string_literal: true

require_relative "abc_state"

class DealCardsState < AbcState
  def action
    :deal_cards
  end

  def deal_cards
    @game.deal_cards
    @game.place_bet

    @game_manager.switch_state(States::WAIT_FOR_PLAYER)
    send_event(:do_nothing)
  end
end
