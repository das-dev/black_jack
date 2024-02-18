# frozen_string_literal: true

require_relative "deal_cards_state"
require_relative "new_game_state"
require_relative "quit_state"
require_relative "wait_for_dealer_state"
require_relative "wait_for_player_state"


module States
  NEW_GAME = NewGameState
  DEAL_CARDS = DealCardsState
  WAIT_FOR_PLAYER = WaitForPlayerState
  WAIT_FOR_DEALER = WaitForDealerState
  QUIT = QuitState
end
