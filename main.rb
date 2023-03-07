require_relative 'player'
require_relative 'game'

player1 = Player.new('Player1')
player2 = Player.new('Player2')
game = Games.new(player1, player2)
game.run_game
