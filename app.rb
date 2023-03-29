# require_relative 'classes/author'
# require_relative 'classes/book'
# require_relative 'classes/game'
require_relative 'classes/genre'
# require_relative 'classes/label'
require_relative 'classes/music_album'
require_relative 'data/preserve_data'
class App
  def initialize
    # @book = Book.new
    # @label = Label.new
    @music_album = []
    @genre = []
    # @game = Game.new
    # @author = Author.new
  end

  # def add_book
  #   @book.add_book
  # end

  # def list_all_books
  #   @book.list_all_books
  # end

  # def list_all_labels
  #   @label.list_all_labels
  # end

  def add_music_album
    puts 'Enter the name of the album:'
    name = gets.chomp
    puts 'Enter the album publish Date: YYYY-MM-DD'
    publish_date = gets.chomp
    puts 'Is the album on spotify? [Y/N]'
    on_spotify = gets.chomp.upcase == 'Y'
    new_album = MusicAlbum.new(name, publish_date, on_spotify, nil)
    @music_album << new_album
    save_data(@music_album, './data/music_album.json')
    puts "Enter the genre of the album:\n"
    genre_name = gets.chomp
    new_genre = Genre.new(nil, genre_name)
    @genre << new_genre
    save_data(@genre, './data/genre.json')
    puts 'A new album has been created successfully'
  end

  def list_all_music_albums
    return puts 'No albums found' if @music_album.empty?

    @music_album = read_data('./data/music_album.json')
    @music_album.each_with_index do |album, index|
      puts "#{index + 1}) Name: #{album['name']}, On spotify: #{album['on_spotify']}, Publish date: #{album['publish_date']}"
    end
  end

  def list_all_genres
    return puts 'No genres found' if @genre.empty?

    @genre = read_data('./data/genre.json')
    @genre.each_with_index do |genre, index|
      puts "#{index + 1}) Genre: #{genre['name']}"
    end
  end

  # def add_a_game
  #   @game.add_a_game
  # end

  # def list_of_games
  #   @game.list_of_games
  # end

  # def list_all_authors
  #   @author.list_all_authors
  # end

  def invalid_input
    puts 'Invalid entry, try again'
  end
end
