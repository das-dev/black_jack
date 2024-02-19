# frozen_string_literal: true

require "forwardable"

class Screen
  attr_reader :game

  extend Forwardable
  def_delegators :@game, :action

  def initialize(debug: false)
    @debug = debug
    render
  end

  def render(context = nil)
    clear unless @debug
    method(action).call(context)
  end

  private

  def new_game(_)
    puts <<~NEW_GAME
      Welcome to the game!
      Type 'q' to exit the game
      or just press 'Enter' to start new game
    NEW_GAME
  end

  def wait_for_player(ctx)
    puts <<~WAIT_FOR_PLAYER
      Your bank: #{ctx.player_bank}
      Dealer bank: #{ctx.dealer_bank}
      Game bank: #{ctx.game_bank}

      Choose an action:
        1. Pass your turn
        2. Add a card
        3. Open your cards
    WAIT_FOR_PLAYER
  end

  def quit(_)
    puts "Goodbye!"
  end

  def clear
    system("clear") || system("cls")
  end
end
