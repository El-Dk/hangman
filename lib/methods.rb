# frozen_string_literal: true

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

def clean_menu_input
  input = gets.chomp
  until %w(1 2 3 4).include?(input)
    print 'Invalid input. Please pick an option(1-4): '
    input = gets.chomp
  end
  input
end

def clean_load_input(size)
  range = *('1'..size.to_s)
  input = gets.chomp
  until range.include?(input)
    print "Invalid input. Please pick a game(1-#{size}): "
    input = gets.chomp
  end
  input.to_i - 1
end

def clean_yes_no
  input = gets.chomp.upcase
  until %w(Y N).include?(input)
    print 'Invalid input. Please pick Y or N: '
    input = gets.chomp.upcase
  end
  input
end

def play_game(hangman)
  puts "\n\n\n"
  hangman.show_fails unless hangman.guesses.empty?
  hangman.show_hangman
  hangman.show_guessed
  loop do
    print 'Do you want to save the game and quit? (Y/N): '
    option = clean_yes_no
    if option == 'Y'
      save_game(hangman)
      break
    end
    print 'Enter your guess: '
    guess = clean_input(hangman)
    hangman.take_a_guess(guess)
    puts "\n\n\n"
    hangman.show_fails unless hangman.guesses.empty?
    hangman.show_hangman
    hangman.show_guessed
    if hangman.winner?
      puts "\n\t\t\t\t------------\n" \
           "\t\t\t\t  \e[102m\e[30mYOU WON!\e[0m\n" \
           "\t\t\t\t------------\n\n"
      break
    end
    next unless hangman.loser?
    puts "\n\t\t\t\t-------------\n" \
         "\t\t\t\t  \e[101m\e[30mYOU LOST!\e[0m\n" \
         "\t\t\t\t-------------\n\n"
    puts "The word was: \e[100m\e[30m#{hangman.word.join}\e[0m."
    break
  end
end

def show_menu
  puts "\n\n\t\t\t\t-----------\n" \
       "\t\t\t\t  HANGMAN\n" \
       "\t\t\t\t-----------\n" \
       "Welcome to Hangman. Please pick an option\n\n" \
       "\t1.- Start a new game.\n" \
       "\t2.- Load a game.\n" \
       "\t3.- Delete a saved game.\n" \
       "\t4.- Exit\n\n"
  print 'Option: '
end

def save_game(hangman)
  Dir.mkdir('saves') unless Dir.exist?('saves')
  file = File.open("saves/#{hangman.guessed_word.join}.txt", "w")
  file.puts Marshal.dump(hangman)
  file.close
  puts "\e[100m\e[30mGame saved!\e[0m"
end

def load_game
  unless Dir.exist?('saves')
    puts 'There are not saved games.'
  else
    saved = Dir.open('saves')
    saves = saved.children
    saved.close
    if saves.empty?
      puts 'There are not any saved games.'
    else
      puts "\nPick a Saved Game.\n\n"
      saves.each.with_index(1) { |save, index| puts "\t#{index}.- #{save.split('.')[0]}"}
      print 'Game: '
      option = clean_load_input(saves.length)
      game = File.open("saves/#{saves[option]}", "r")
      hangman = Marshal.load(game.read)
      game.close
      puts "\e[100m\e[30mGame loaded!\e[0m"
      play_game(hangman)
    end
  end
end

def delete_game
  unless Dir.exist?('saves')
    puts 'There are not saved games.'
  else
    saved = Dir.open('saves')
    saves = saved.children
    saved.close
    if saves.empty?
      puts "\n\e[101m\e[30mThere are not any saved games.\e[0m"
    else
      puts "\nPick a Saved Game.\n\n"
      saves.each.with_index(1) { |save, index| puts "\t#{index}.- #{save.split('.')[0]}"}
      print 'Game: '
      option = clean_load_input(saves.length)
      File.delete("saves/#{saves[option]}")
    end
  end
end
