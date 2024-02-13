# frozen_string_literal: true

class Controller
  ACTIONS = { ":q" => :exit_game }.freeze

  def initialize(queue)
    @queue = queue
  end

  def process_input
    input = gets.chomp
    action = ACTIONS[input]
    return unless action

    @queue << (event(action))
  end

  private

  def event(action)
    ->(game) { game.user_play(action) }
  end
end
