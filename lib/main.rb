# frozen_string_literal: true

require './lib/hangman'
require './lib/methods'

loop do
  show_menu
  option = clean_menu_input
  case option
  when '1'
    hangman = Hangman.new(choose_word)
    play_game(hangman)
    print 'Do you want to play again? (Y/N): '
    option = clean_yes_no
  when '2'
    load_game
    print 'Do you want to play again? (Y/N): '
    option = clean_yes_no
  when '3'
    delete_game
    option = 'Y'
  when '4'
    break
  end
  break unless option == 'Y'
end
