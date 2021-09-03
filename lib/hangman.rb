# frozen_string_literal: true

require './lib/display'

# Hangman class definition
class Hangman
  include Display
  attr_reader :fails, :guesses, :word, :guessed_word, :rights

  def initialize(word)
    @fails = 0
    @word = word.split('')
    @guessed_word = Array.new(word.length, '_')
    @guesses = []
    @rights = []
    build_hangman
  end

  def take_a_guess(letter)
    unless @word.include?(letter)
      @fails +=1
      @guesses << letter
    else
      @rights << letter
      @word.each_with_index do |word_letter, index|
        @guessed_word[index] = letter if word_letter == letter
      end
    end
  end

  def already_picked?(letter)
    @guesses.include?(letter)
  end

  def winner?
    !@guessed_word.include?('_')
  end

  def loser?
    @fails == 6
  end
end
