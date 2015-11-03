require 'colorize'

# ======================================
#
#  Game class
#
# ======================================
class Game

  attr_accessor  :current_player, :quit_game

  def initialize
    @current_player = nil
    @quit_game = false
  end

  # ======================================
  #
  #  Re-initialize Game to start over
  #
  # ======================================
  def reinitialize_game(player)
    self.quit_game = false
    self.current_player = player

    puts ""
    puts "Welcome to a new version of the 2 Player Game."
    puts ""

  end


  # ======================================
  #
  #  Display lost round message
  #
  # ======================================
  def display_lost_round_message
    puts "#{current_player.name} lost and their score is now #{current_player.score}".red

  end

  # ======================================
  #
  #  Display won round message
  #
  # ======================================
  def display_won_round_message
      puts "#{current_player.name} earned a point and their score is now #{current_player.score}".green

  end

  # ======================================
  #
  #  Switch players at end of round
  #
  # ======================================
  def switch_players(player_one, player_two)
    self.current_player = current_player == player_one ? player_two : player_one

  end


  # ======================================
  #
  #  Actions when game is lost
  #
  # ======================================
  def actions_when_game_is_lost
    puts ""
    puts "GAME OVER".red
    self.quit_game = true
  end

  # ======================================
  #
  #  Ask whether they want to play another game
  #
  # ======================================
  def another_game?

    puts ""
    puts "Do you want to play another game? Y/N "

    answer = gets.chomp

    return true if answer == 'Y'

    false

  end

end

