# frozen_string_literal: true

require "forwardable"

class Screen
  attr_reader :game

  extend Forwardable
  def_delegators :@game, :action

  def initialize(initial_action, debug: false)
    @debug = debug
    render(initial_action)
  end

  def render(action, context = nil)
    clear unless @debug
    puts method(action).call(context)
  end

  private

  def new_game(_)
    <<~NEW_GAME
      Welcome to the game!
      Type 'q' to exit the game
      or just press 'Enter' to start new game
    NEW_GAME
  end

  def deal_cards(ctx)
    <<~DEAL_CARDS
      #{state(ctx)}
      Press Enter to deal cards...
    DEAL_CARDS
  end

  def wait_for_player(ctx)
    <<~WAIT_FOR_PLAYER
      #{state(ctx)}

      Choose an action:
        1. Stand
        2. Hit
        3. Reveal
    WAIT_FOR_PLAYER
  end

  def reveal(ctx)
    <<~REVEAL
      #{state(ctx)}

      Type 'n' to start new game
      or just press 'Enter' to start new deal
    REVEAL
  end

  def quit(_)
    "Goodbye!"
  end

  def state(ctx)
    <<~STATE
      Dealer bank: $#{ctx[:dealer_bank]}
      Dealer cards: #{ctx[:dealer_cards]}

      Game bank: $#{ctx[:game_bank]}

      Your cards: #{ctx[:player_cards]}
      Your bank: $#{ctx[:player_bank]}
    STATE
  end

  def clear
    system("clear") || system("cls")
  end
end
