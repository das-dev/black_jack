# frozen_string_literal: true

class State
  def initialize(game)
    @game = game
  end

  def transition(state)
    puts "Transitioning from #{self.class} to #{state.class}"
    @game.state = state
  end

  def user_play(action)
    method(action).call
  end

  def dealer_play; end

  def exit_game
    send_dealer_event
    transition(ExitGameState.new(@game))
  end

  def send_dealer_event
    @game.queue << (->(game) { game.dealer_play })
  end
end

class StartGameState < State
  def action
    :start_game
  end

  def enter
    send_dealer_event
    transition(DealCardsState.new(@game))
  end
end

class DealCardsState < State
  def action
    :deal_cards
  end

  def dealer_play
    transition(WaitForPlayerState.new(@game))
  end
end

class WaitForPlayerState < State
  def action
    :wait_for_player
  end

  def pass_turn
    send_dealer_event
    transition(PassTurnState.new(@game))
  end

  def add_card
    send_dealer_event
    transition(AddCardState.new(@game))
  end

  def open_cards
    send_dealer_event
    transition(OpenCardsState.new(@game))
  end
end

class PassTurnState < State
  def action
    :pass_turn
  end

  def dealer_play
    send_dealer_event
    transition(WaitForDealerState.new(@game))
  end
end

class AddCardState < State
  def action
    :add_card
  end

  def dealer_play
    send_dealer_event
    transition(WaitForDealerState.new(@game))
  end
end

class OpenCardsState < State
  def action
    :open_cards
  end

  def dealer_play
    send_dealer_event
    transition(WaitForDealerState.new(@game))
  end
end

class WaitForDealerState < State
  def action
    :wait_for_dealer
  end

  def dealer_play
    transition(WaitForPlayerState.new(@game))
  end
end

class ExitGameState < State
  def action
    :exit_game
  end
end
