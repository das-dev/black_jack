# frozen_string_literal: true

require_relative "abc_state"

class RevealCardsState < AbcState
  def action
    :reveal
  end

  def reveal
    @game.finish_deal
  end

  def deal_cards
    @game_manager.switch_state(States::DEAL_CARDS)
    send_event(:deal_cards)
  end

  def events_map
    { "" => :deal_cards, "n" => :new_game, "q" => :quit }
  end
end
