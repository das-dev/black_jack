# frozen_string_literal: true

require "forwardable"

class Screen
  extend Forwardable
  def_delegators :@game, :action

  def initialize(game)
    @game = game
    render
  end

  def render
    clear
    method(action).call
  end

  def start_game
    puts <<~START_GAME
      Welcome to the game!
      Type ':q' to exit the game
      or just press 'Enter' to start the game
    START_GAME
  end

  def deal_cards
    puts <<~DEAL_CARDS
      Dealing cards...
      Choose an action:
        1. Pass your turn
        2. Add a card
        3. Open your cards
    DEAL_CARDS
  end

  def wait_for_player
    puts <<~WAIT_FOR_PLAYER
      Waiting for your action...
      Choose an action:
        1. Pass your turn
        2. Add a card
        3. Open your cards
    WAIT_FOR_PLAYER
  end

  def exit_game
    puts "Goodbye!"
  end

  def clear
    system("clear") || system("cls")
  end
end
