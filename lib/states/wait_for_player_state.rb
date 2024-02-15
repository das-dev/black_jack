# frozen_string_literal: true

require_relative "abc_state"

class WaitForPlayerState < AbcState
  def action
    :wait_for_player
  end

  def pass_turn
    @game.switch_state(States::PASS_TURN)
    trigger_state
  end

  def add_card
    @game.switch_state(States::ADD_CARD)
    trigger_state
  end

  def open_cards
    @game.switch_state(States::OPEN_CARDS)
    trigger_state
  end
end
