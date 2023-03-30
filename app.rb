require_relative './classes/author'
require_relative './classes/book'
require_relative './classes/game'
require_relative './classes/genre'
require_relative './classes/label'
require_relative './classes/music_album'
require_relative './data/preserve_data'

class App
  def initialize
    @games = []
    @authors = []
  end

  def add_a_game
    print 'Enter the publish date of game [YYYY-MM-DD]: '
    publish_date = gets.chomp.upcase
    print 'Is it a multiplayer game [Y/N]: '
    multiplayer = gets.chomp
    case multiplayer
    when 'Y'
      multiplayer = true
    when 'N'
      multiplayer = false
    end
    print 'What is the last played date? [YYYY-MM-DD]: '
    last_played_at = gets.chomp.upcase
    new_game = Game.new(publish_date, multiplayer, last_played_at)
    @games << new_game
    print 'Enter the author first name: '
    fname = gets.chomp
    print 'Enter the author last name: '
    lname = gets.chomp
    new_author = Author.new(fname, lname)
    @authors << new_author
    save_data(@games, './data/game.json')
    save_data(@authors, './data/author.json')
    puts 'Author added for the Game successfully 🤹‍♂️✅ '
  end

  def list_of_games
    @games = read_data('./data/games.json')
    return puts 'No Games to Show 🚫 Please add some Games . . .' if @games.empty?

    @games.each_with_index do |game, index|
      puts "#{index + 1} Multiplayer: #{game.multiplayer} | Last Played: #{game.last_played_at}"
    end
  end

  def list_all_authors
    @authors = read_data('./data/author.json')
    if @authors.empty?
      puts 'No author to Show 🚫 Please add some Authors . . .'
    else
      @authors.each_with_index do |author, index|
        puts "#{index + 1} First Name: #{author.first_name} | Last Name: #{author.last_name}"
      end
    end
  end

  def invalid_input
    puts 'Invalid entry, try again'
  end
end
