require_relative 'main/console'
require_relative 'main/options'

class Main
  def start
    puts 'Catalog Of My Things!'
    puts
    display = DisplayMenu.new
    choose_option = ChooseOption.new
    loop do
      display.print_menu
      option = gets.chomp.to_i
      choose_option.choose_option(option)
    end
  end
end

main = Main.new
main.start
