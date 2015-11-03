# ======================================
#
#  Question class
#
# ======================================
class Question

  attr_accessor  :text_of_question, :answer, :actual_answer

  class InvalidGuessError < StandardError
  end

  def initialize
    @text_of_question = ""
    @answer = ""
    @actual_answer = nil
  end

  # ======================================
  #
  #  Generate an operand
  #
  # ======================================
  def generate_an_operand

    operand = rand(1..20)

    if operand < 1 || operand > 20
      puts 'Errror in generate_an_operand() method. Invalid operand #{operand}'
    end

    operand

  end

  # ======================================
  #
  #  Generate an operator
  #
  # ======================================
  def generate_an_operator

    number = rand(1..4)

    case
    when number == 1
      operator = "plus"
    when number == 2
      operator = "minus"
    when number == 3
      operator = "times"
    when number == 4
      operator = "divide by"
    else
      puts 'Error in generate_an_operator() method. Invalid operator'
    end

    operator
  end

  # ======================================
  #
  #  Generate a question
  #
  # ======================================
  def generate_question(player)

    operand_1 = generate_an_operand

    operator = generate_an_operator

    operand_2 = generate_an_operand

    # calculate actual_answer
    case
      when operator == "plus"
        self.actual_answer = operand_1.to_f + operand_2.to_f
      when operator == "minus"
        self.actual_answer = operand_1.to_f - operand_2.to_f
      when operator == "times"
        self.actual_answer = operand_1.to_f * operand_2.to_f
      when operator == "divide by"
        self.actual_answer = operand_1.to_f / operand_2.to_f
      else
        puts "generate_question() method -- Error calculating actual_answer operator wrong #{operator}"
    end

    # limit float to two decimal places
    self.actual_answer = actual_answer.round(2)

    self.text_of_question = "#{player.name}: What does #{operand_1} #{operator} #{operand_2} equal?"

  end



  # ======================================
  #
  #  Prompt player for answer to question
  #
  # ======================================
  def prompt_player_for_answer
    begin
      puts ""
      puts text_of_question
      puts ""

      self.answer = gets.chomp

      # use regex to determine type of answer
      temp = answer.match(/-?\d+\.\d*/)
      puts "temp = #{temp.inspect}"
      puts "temp.class = #{temp.class}"

      raise InvalidGuessError if temp.nil?

      self.answer = answer.to_f.round(2)

    rescue InvalidGuessError
      puts "You need to enter a real number (9.9) with at least one place before and after the decimal point"
      prompt_player_for_answer
    rescue (NoMethodError) => e
      puts e
      puts "You need to enter a real number (9.9) with at least one place before and after the decimal point"

      prompt_player_for_answer

    end

  end

  # ======================================
  #
  #  Verify answer to question
  #
  # ======================================
  def verify_answer(current_player)

     if answer == actual_answer
        result = "won round"
        current_player.gain_a_point
        # current_player.score += 1
     else
        result = "lost round"
        current_player.lose_a_point
        #current_player.score -= 1
     end

     result

  end

end
