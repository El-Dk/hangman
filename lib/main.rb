# frozen_string_literal: true

require './lib/hangman'

def choose_word
  dictionary = File.open('dictionary.txt', 'r')
  words = dictionary.readlines
  dictionary.close
  word = words[(words.length * rand).to_i].strip
  word = words[(words.length * rand).to_i].strip until word.length.between?(5, 12)
  word.upcase
end

def clean_input(hangman)
  letter = ''
  loop do
    letter = gets.chomp.upcase
    break if letter.length == 1 && letter.match?(/[A-Z]/)
    puts 'Invalid input!'
    print 'Enter a new letter: '
  end
  loop do
    break unless hangman.already_picked?(letter)
    puts "ERROR! You've already picked that letter."
    print 'Enter a new letter: '
    letter = clean_input(hangman)
  end
  letter
end

def play_game(hangman)
  hangman.show_hangman
  hangman.show_guessed
  hangman.show_fails
  loop do
    guess = clean_input(hangman)
    hangman.take_a_guess(guess)
    hangman.show_hangman
    hangman.show_guessed
    hangman.show_fails
    if(hangman.winner?)
      puts "\t\t\t\t------------\n" +
        "\t\t\t\t  YOU WON!\n" +
        "\t\t\t\t------------"
      break
    end
    if(hangman.loser?)
      puts "\t\t\t\t-------------\n" +
        "\t\t\t\t  YOU LOST!\n" +
        "\t\t\t\t-------------"
      puts "The word was: #{hangman.word.join}"
      break
    end
  end
end

a = Hangman.new(choose_word)
=begin 
a.show_hangman
loop do
  b = clean_input(a)
  a.take_a_guess(b)
  a.show_hangman
  a.show_guessed
  a.show_fails
end
=end
play_game(a)
