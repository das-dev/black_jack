# frozen_string_literal: true

require_relative "abc_state"

class NewGameState < AbcState
  def action
    :new_game
  end

  def new_game
    @game_manager.new_game

    @game_manager.switch_state(States::DEAL_CARDS)
    send_event(:deal_cards)
  end

  def events_map
    { "" => :new_game, "q" => :quit }
  end
end
