# frozen_string_literal: true

class Controller
  ACTIONS = {
    "" => :enter,
    "1" => :pass_turn,
    "2" => :add_card,
    "3" => :open_cards,
    "q" => :exit_game
  }.freeze

  def initialize(queue)
    @queue = queue
  end

  def process_input
    action = ACTIONS[gets.chomp]
    @queue << action if action
  end
end
