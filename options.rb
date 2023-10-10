class Options
  def all_options
      puts "\nPlease enter a number:\n
    1 - List all Books\n
    2 - List all People\n
    3 - Create a Person\n
    4 - Create a Book\n
    5 - Create a Rental\n
    6 - List all rentals for a given person id\n
    7 - Exit"
    end

    def call_option(option)
      app = App.new
      app.run

      case option
      when 1
        list_books
      when 2
        list_people
      when 3
        create_person
      when 4
        create_book
      when 5
        create_rental
      when 6
        list_rentals
      else
        puts 'Choose between 1 - 7'
      end
    end
end