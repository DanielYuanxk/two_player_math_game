require './player'
class Games
  def initialize(p1, p2)
    @players = [p1, p2]

    @current_player_index = 0
    @num1 = nil
    @num2 = nil
    @winner = ''
  end

  def current_player
    @players[@current_player_index]
  end

  def switch_player
    @current_player_index = (@current_player_index.zero? ? 1 : 0)
  end

  def rand_numbers
    @num1 = rand(1..20)
    @num2 = rand(1..20)
  end

  def check_answer(answer, num1, num2)
    answer == (num1 + num2)
  end

  def game_over?
    @players.any? { |player| player.lives.zero? }
  end

  def winner
    @winner = @players.max_by(&:score)
  end

  def run_game
    until game_over?
      rand_numbers
      puts "#{current_player.name}: What is #{@num1} + #{@num2}"
      answer = gets.chomp.to_i
      if check_answer(answer, @num1, @num2)
        puts "#{current_player.name}: YES! You are correct."
        current_player.update_score(1)
      else
        puts "#{current_player.name}: Seriously? No!"
        current_player.update_lives(1)
      end
      puts "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3"

      switch_player
      puts '---- NEW TURN ----'
    end
    winner
    puts "#{@winner.name} wins with a score of #{winner.score}"
    puts '---- GAME OVER ----'
    puts 'Good bye!'
  end
end
