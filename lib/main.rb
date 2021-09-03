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

a = Hangman.new(choose_word)
puts a.show_guessed
p a.word
puts a.word.include?('a')
a.show_hangman
loop do
  b = clean_input(a)
  a.take_a_guess(b)
  a.show_hangman
  a.show_guessed
  a.show_fails
end
