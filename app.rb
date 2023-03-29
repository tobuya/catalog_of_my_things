require_relative 'classes/author'
require_relative 'classes/book'
require_relative 'classes/game'
require_relative 'classes/genre'
require_relative 'classes/label'
require_relative 'classes/music_album'

class App
  def initialize
    @book = Book.new
    @label = Label.new
    @music_album = MusicAlbum.new
    @genre = Genre.new
    @game = Game.new
    @author = Author.new
  end

  def add_book
    @book.add_book
  end

  def list_all_books
    @book.list_all_books
  end

  def list_all_labels
    @label.list_all_labels
  end

  def add_music_album
    @music_album.add_music_album
  end

  def list_all_music_albums
    @music_album.list_all_music_albums
  end

  def list_all_genres
    @genre.list_all_genres
  end

  def add_a_game
    @game.add_a_game
  end

  def list_of_games
    @game.list_of_games
  end

  def list_all_authors
    @author.list_all_authors
  end

  def invalid_input
    puts 'Invalid entry, try again'
  end
end
