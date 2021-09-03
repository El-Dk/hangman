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

a = Hangman.new(choose_word)
puts a.show_guessed
p a.word
puts a.word.include?('a')
a.show_hangman
loop do
  b = gets.chomp.upcase
  loop do
    break unless a.already_picked?(b)
    b = gets.chomp.upcase
  end
  a.take_a_guess(b)
  a.show_hangman
  a.show_guessed
  a.show_fails
end
