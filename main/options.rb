require_relative '../app'

class ChooseOption
  def initialize
    @app = App.new
  end

  def choose_option(option)
    case option
    when 1
      @app.add_book
    when 2
      @app.list_all_books
    when 3
      @app.list_all_labels

    when 4
      @app.add_music_album
    when 5
      @app.list_all_music_albums
    when 6
      @app.list_all_genres
    when 7
      @app.add_a_game
    when 8
      @app.list_of_games
    when 9
      @app.list_all_authors
    when 10
      puts 'Thank you for using this app!'
      exit
    else
      puts 'That is not a valid option'
    end
  end
end
