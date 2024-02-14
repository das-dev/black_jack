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
    puts <<~START_SCREEN
      Welcome to the game!
      Type: ':q' to exit the game
    START_SCREEN
  end

  def exit_game
    puts "Goodbye!"
  end

  def clear
    system("clear") || system("cls")
  end
end
