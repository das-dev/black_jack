# frozen_string_literal: true

class Controller
  ACTIONS = {
    "" => :enter,
    "1" => :pass_turn,
    "2" => :add_card,
    "3" => :open_cards,
    ":q" => :exit_game
  }.freeze

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
