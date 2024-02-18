# frozen_string_literal: true

require_relative "abc_state"

class QuitState < AbcState
  def action
    :quit
  end
end
