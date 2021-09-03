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
  puts "\n\n\n"
  hangman.show_fails unless hangman.guesses.empty?
  hangman.show_hangman
  hangman.show_guessed
  loop do
    print 'Enter your guess: '
    guess = clean_input(hangman)
    hangman.take_a_guess(guess)
    puts "\n\n\n"
    hangman.show_fails unless hangman.guesses.empty?
    hangman.show_hangman
    hangman.show_guessed
    if hangman.winner?
      puts "\n\t\t\t\t------------\n" \
           "\t\t\t\t  YOU WON!\n" \
           "\t\t\t\t------------\n\n"
      break
    end
    next unless hangman.loser?

    puts "\n\t\t\t\t-------------\n" \
         "\t\t\t\t  YOU LOST!\n" \
         "\t\t\t\t-------------\n\n"
    puts "The word was: #{hangman.word.join}"
    break
  end
end

a = Hangman.new(choose_word)
play_game(a)
