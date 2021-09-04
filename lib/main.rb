# frozen_string_literal: true

require './lib/hangman'
require './lib/methods'

a = Hangman.new(choose_word)
show_menu
o = clean_menu_input
case o
when '1'
  play_game(a)
when '2'
  load_game
end
