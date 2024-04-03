# frozen_string_literal: true

require_relative "abc_state"

class WaitForPlayerState < AbcState
  def action
    :wait_for_player
  end

  def stand
    @game_manager.switch_state(States::WAIT_FOR_DEALER)
    send_event(:wait_for_dealer)
  end

  def hit
    return if @game.player_full?

    @game.add_card_to_player

    @game_manager.switch_state(States::WAIT_FOR_DEALER)
    send_event(:wait_for_dealer)
  end

  def reveal
    @game_manager.switch_state(States::WAIT_FOR_DEALER)
    send_event(:wait_for_dealer)
  end

  def events_map
    { "1" => :stand, "2" => :hit, "3" => :reveal, "q" => :quit }
  end
end
