require_relative 'classes/book'
require_relative 'classes/label'
# require './data/preserve_data'
# require_relative 'classes/author'
# require_relative 'classes/game'
# require_relative 'classes/genre'
# require_relative 'classes/music_album'
class App
  def initialize
    @books = []
    @labels = []
    # @music_album = MusicAlbum.new
    # @genre = Genre.new
    # @game = Game.new
    # @author = Author.new
  end

  def colorize_output(color_code, statements)
    puts "\e[#{color_code}m#{statements}\e[0m"
  end

  def colorize_outprint(color_code, statements)
    print "\e[#{color_code}m#{statements}\e[0m"
  end

  def add_book
    puts 'Please enter the name of the book:'
    name = gets.chomp
    puts 'Please enter the publisher:'
    publisher = gets.chomp
    puts 'Please enter state of the book: good or bad'
    cover_state = gets.chomp
    if cover_state != 'good' && cover_state != 'bad'
      puts 'Invalid state'
      return
    end
    puts 'Please enter the publish date of the book: YYYY-MM-DD'
    date = gets.chomp
    book = Book.new(name, cover_state, publisher, date)
    @books << book
    puts "Enter the title label of the book:\n"
    label_title = gets.chomp
    puts "Enter the label color of the book:\n"
    label_color = gets.chomp
    new_label = Label.new(label_title, label_color)
    @labels << new_label
    # save_data(@labels, './data/labels.json' )
    # save_data(@books, './data/books.json')
    colorize_output(32, "The Book '#{name}' was added successfully!")
  end

  def list_all_books
    # @books = read_data('./data/books.json')
    if @books.empty?
      colorize_output(31, 'There are no books yet')
      return
    end
    @books.each_with_index do |book, index|
      print "#{index + 1}-Name: #{book['name']}, Publisher: #{book['publisher']},
       Cover state: #{book['cover_state']}, Publish date: #{book['publish_date']}\n\n"
    end
  end

  def list_all_labels
    if @labels.empty?
      colorize_output(31, 'There are no labels yet')
    else
      puts "-------------------------------\n"
      @labels.each do |label|
        print "ID: #{label.id} , Label-Title: #{label.title} , Color: #{label.color}\n"
      end
      puts "-------------------------------\n\n"
    end
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

  # def list_all_authors
  #   @author.list_all_authors
  # end

  def invalid_input
    puts 'Invalid entry, try again'
  end
end
