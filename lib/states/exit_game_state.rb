# frozen_string_literal: true

require_relative "abc_state"

class ExitGameState < AbcState
  def action
    :exit_game
  end
end
