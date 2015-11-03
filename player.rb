# ======================================
#
#  Player class
#
# ======================================
class Player

  attr_accessor :name
  attr_accessor :score
  attr_accessor :actual_answer

  class InvalidName < StandardError
  end

  def initialize
    @name = ''
    @score = 0
  end

  # ======================================
  #
  #  Get player name
  #
  # ======================================
  def get_player_name(count)
    begin
      puts ""
      puts "Enter Player #{count}'s name:"

      temp = gets.chomp

      raise InvalidName if temp == ""

      self.name = temp

    rescue InvalidName
      puts "You need to enter a player name."
      get_player_name(count)

    end
  end


  # ======================================
  #
  #  reset the score of a Player instance
  #
  # ======================================
  def initialize_score

     self.score = 3

  end

  # ======================================
  #
  #  Player gains a point
  #
  # ======================================
  def gain_a_point

     self.score += 1

  end

  # ======================================
  #
  #  Player loses a point
  #
  # ======================================
  def lose_a_point

     self.score -= 1

  end

  # ======================================
  #
  #  Has Player lost game ?
  #
  # ======================================
  def lost_game?

     return true if self.score == 0

     false
  end

end

