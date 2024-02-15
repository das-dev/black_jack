# frozen_string_literal: true

require_relative "add_card_state"
require_relative "deal_cards_state"
require_relative "exit_game_state"
require_relative "open_cards_state"
require_relative "pass_turn_state"
require_relative "start_game_state"
require_relative "wait_for_dealer_state"
require_relative "wait_for_player_state"


module States
  START_GAME = StartGameState
  DEAL_CARDS = DealCardsState
  WAIT_FOR_PLAYER = WaitForPlayerState
  PASS_TURN = PassTurnState
  ADD_CARD = AddCardState
  OPEN_CARDS = OpenCardsState
  WAIT_FOR_DEALER = WaitForDealerState
  EXIT_GAME = ExitGameState
end
