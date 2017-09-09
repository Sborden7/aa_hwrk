class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = seq.length
    @game_over = false
    print "\n\n\n       ~~ Welcome to Simon SATH ~~\n\n\n"
    sleep 3
  end

  def play
    until game_over == true
      add_random_color
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    sleep 2
    guess = require_sequence
    sleep 2
    round_success_message if game_over == false
    sleep 2
  end

  def show_sequence
    print "The color sequence is coming up... ready?\n\n"
    sleep 1
    print "Set...\n\n"
    sleep 1
    print "Go!\n\n"
    sleep 2
    system "clear"
    seq.each do |color|
      print color
      sleep 1
      system "clear"
      sleep 1
    end
  end

  def require_sequence
    print "\n\nPlease type your guess in, one color at a time!\n\n"
    guess_sequence = []

    until guess_sequence.length == seq.length
      print "\n\nGuess the next color in the sequence --->"
      guess_sequence << gets.chomp
      index = guess_sequence.length - 1

      if seq[index] != guess_sequence[index]
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    seq << %w(green red yellow blue).sample
    @sequence_length = seq.length - 1
  end

  def round_success_message
    print "\n\nNice job, you guessed the color sequence correctly!\n\n"
  end

  def game_over_message
    print "\n\nGame over! You got #{sequence_length} colors!"
  end

  def reset_game
    print "\n\nDo you want to play again?\n\n"
    print "Type y or n here --->"
    yes_or_no = gets.chomp.downcase

    if yes_or_no == "y"
      system "clear"
      g = Simon.new
      g.play
    else
      print "Okay! Byeeeeeeeeeeeeee!"
      sleep 2
      system "clear"
      system "quit"
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  s = Simon.new
  s.play
end
