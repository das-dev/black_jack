# frozen_string_literal: true

class State
  def initialize(game)
    @game = game
  end

  def transition(state)
    @game.state = state
  end

  def user_play(_); end

  def dealer_play; end
end

class StartGameState < State
  def action
    :start_game
  end

  def user_play(action)
    method(action).call
  end

  def exit_game
    @game.queue << (->(game) { game.dealer_play })
    transition(ExitGameState.new(@game))
  end
end

class ExitGameState < State
  def action
    :exit_game
  end
end
