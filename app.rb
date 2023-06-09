require_relative 'classes/book'
require_relative 'classes/label'
require_relative 'classes/genre'
require_relative 'classes/game'
require_relative 'classes/author'
require_relative 'classes/music_album'
require_relative 'data/preserve_data'

class App
  def initialize
    @books = []
    @labels = []
    @music_album = []
    @genre = []
    @games = []
    @authors = []
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
    puts 'Please enter the author name:'
    author = gets.chomp
    puts 'Please enter state of the book: good or bad'
    cover_state = gets.chomp
    if cover_state != 'good' && cover_state != 'bad'
      puts 'Invalid state'
      return
    end
    puts 'Please enter the publish date of the book: YYYY-MM-DD'
    date = gets.chomp
    book = Book.new(name, cover_state, publisher, date, author)
    @books << book
    puts "Enter the title label of the book:\n"
    label_title = gets.chomp
    puts "Enter the label color of the book:\n"
    label_color = gets.chomp
    new_label = Label.new(label_title, label_color)
    @labels << new_label
    save_data(@labels, './data/labels.json')
    save_data(@books, './data/books.json')
    colorize_output(32, "The Book '#{name}' was added successfully!")
  end

  def list_all_books
    @books = read_data('./data/books.json')
    if @books.empty?
      colorize_output(31, 'There are no books yet')
      return
    end
    @books.each_with_index do |book, index|
      print "#{index + 1}-Name: #{book['name']}, Publisher: #{book['publisher']},
       Cover state: #{book['cover_state']}, Publish date: #{book['publish_date']}, Author: #{book['author']}\n\n"
    end
  end

  def list_all_labels
    @labels = read_data('./data/labels.json')
    if @labels.empty?
      colorize_output(31, 'There are no labels yet')
    else
      puts "-------------------------------\n"
      @labels.each do |label|
        print "ID: #{label['id']} , Label-Title: #{label['title']} , Color: #{label['color']}\n"
      end
      puts "-------------------------------\n\n"
    end
  end

  def add_music_album
    colorize_output(32, 'Enter the name of the album:')
    name = gets.chomp
    colorize_output(32, 'Enter the album publish Date: YYYY-MM-DD')
    publish_date = gets.chomp
    colorize_output(32, 'Is the album on spotify? [Y/N]')
    on_spotify = gets.chomp.upcase == 'Y'
    new_album = MusicAlbum.new(name, publish_date, on_spotify, nil)
    @music_album << new_album
    save_data(@music_album, './data/music_album.json')
    colorize_output(32, 'Enter the genre of the album:\n')
    genre_name = gets.chomp
    new_genre = Genre.new(nil, genre_name)
    @genre << new_genre
    save_data(@genre, './data/genre.json')
    colorize_output(32, 'A new album has been created successfully!')
  end

  def list_all_music_albums
    @music_album = read_data('./data/music_album.json')
    colorize_output(31, 'No albums found') if @music_album.empty?

    @music_album.each_with_index do |album, index|
      colorize_output(32, "#{index + 1}) Name: #{album['name']}, On spotify: #{album['on_spotify']}, Publish date: #{album['publish_date']}")
    end
  end

  def list_all_genres
    @genre = read_data('./data/genre.json')
    colorize_output(31, 'No albums found') if @music_album.empty?

    @genre.each_with_index do |genre, index|
      colorize_output(32, "#{index + 1}) Genre: #{genre['name']}")
    end
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
    game = Game.new(nil, publish_date, multiplayer, last_played_at)
    @games << game
    print 'Enter the author first name: '
    fname = gets.chomp
    print 'Enter the author last name: '
    lname = gets.chomp
    new_author = Author.new(fname, lname)
    @authors << new_author
    save_data(@games, './data/game.json')
    save_data(@authors, './data/author.json')
    colorize_output(32, 'Author added for the Game successfully 🤹‍♂️✅')
  end

  def list_of_games
    @games = read_data('./data/game.json')
    return puts 'No Games to Show 🚫 Please add some Games . . .' if @games.empty?

    @games.each_with_index do |game, index|
      puts "#{index + 1} Multiplayer: #{game['multiplayer']} | Last Played: #{game['last_played_at']}"
    end
  end

  def list_all_authors
    @authors = read_data('./data/author.json')
    if @authors.empty?
      colorize_output(32, 'No author to Show 🚫 Please add some Authors . . .')
    else
      @authors.each_with_index do |author, index|
        puts "#{index + 1} First Name: #{author['first_name']} | Last Name: #{author['last_name']}"
      end
    end
  end

  def invalid_input
    colorize_output(32, 'Invalid entry, try again')
  end
end
