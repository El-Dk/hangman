# frozen_string_literal: true

# Display module definition
module Display
  def build_hangman
    @hangman = [
      "\t\t\t\t-------
      \t\t\t\t|     |
      \t\t\t\t|
      \t\t\t\t|
      \t\t\t\t|
      \t\t\t\t|
      \t\t\t\t|
      \t\t\t\t|
      \t\t\t    -----------------\n\n",
      "\t\t\t\t-------
      \t\t\t\t|     |
      \t\t\t\t|     \e[37m\u25CF\e[0m
      \t\t\t\t|
      \t\t\t\t|
      \t\t\t\t|
      \t\t\t\t|
      \t\t\t\t|
      \t\t\t    -----------------\n\n",
      "\t\t\t\t-------
      \t\t\t\t|     |
      \t\t\t\t|     \e[37m\u25CF\e[0m
      \t\t\t\t|    /
      \t\t\t\t|
      \t\t\t\t|
      \t\t\t\t|
      \t\t\t\t|
      \t\t\t    -----------------\n\n",
      "\t\t\t\t-------
      \t\t\t\t|     |
      \t\t\t\t|     \e[37m\u25CF\e[0m
      \t\t\t\t|    /|\\
      \t\t\t\t|
      \t\t\t\t|
      \t\t\t\t|
      \t\t\t\t|
      \t\t\t    -----------------\n\n",
      "\t\t\t\t-------
      \t\t\t\t|     |
      \t\t\t\t|     \e[37m\u25CF\e[0m
      \t\t\t\t|    /|\\
      \t\t\t\t|     |
      \t\t\t\t|
      \t\t\t\t|
      \t\t\t\t|
      \t\t\t    -----------------\n\n",
      "\t\t\t\t-------
      \t\t\t\t|     |
      \t\t\t\t|     \e[37m\u25CF\e[0m
      \t\t\t\t|    /|\\
      \t\t\t\t|     |
      \t\t\t\t|    /
      \t\t\t\t|
      \t\t\t\t|
      \t\t\t    -----------------\n\n",
      "\t\t\t\t-------
      \t\t\t\t|     |
      \t\t\t\t|     \e[37m\u25CF\e[0m
      \t\t\t\t|    /|\\
      \t\t\t\t|     |
      \t\t\t\t|    / \\
      \t\t\t\t|
      \t\t\t\t|
      \t\t\t    -----------------\n\n"
    ]
  end

  def show_hangman
    puts @hangman[@fails]
  end
  
  def show_guessed
    @guessed_word.each { |letter| print "#{letter} " }
    puts "\n\n"
  end

  def show_fails
    @guesses.each { |letter| print "\e[9m#{letter}\e[0m " }
    puts "\n\n"
  end
end
