require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'

# create app class
class App
  attr_accessor :books, :people, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_items(items)
    items.each { |item| puts yield(item) }
  end

  def list_books
    list_items(@books) { |book| "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def list_people
    list_items(@people) do |person|
      "[#{person.class.name}] Name:#{person.name} ID:#{person.id} Age:#{person.age}"
    end
  end

  def create_person(type)
    print "Age: "; age = gets.chomp.to_i
    print "Name: "; name = gets.chomp

    if type == :student && age < 18
      print "Has parent permission? [Y/N]: "
      permission = gets.chomp.downcase == 'y'
    end

    person = type == :student ? Student.new(age, name, parent_permission: permission) : Teacher.new(nil, age, name)
    @people.push(person)

    puts "#{type.capitalize} created successfully!"
  end

  def create_book
    print 'Author: '; author = gets.chomp
    print 'Title: '; title = gets.chomp

    book = Book.new(title, author)
    @books.push(book)

    puts "Book created successfully!"
  end

  def create_rental
    return puts "Zero people added to the list" if @people.empty?
    return puts "No books added to the list" if @books.empty?

    puts "Please select a person from the list below by a number (and not the id):"
    list_people
    person_choice = gets.chomp.to_i

    puts "Please select the book from the list below by a number:"
    list_books
    book_choice = gets.chomp.to_i

    print "Date (YYYY/MM/DD): "; date = gets.chomp

    selected_person, selected_book = @people[person_choice - 1], @books[book_choice - 1]
    rental = selected_person.add_rental(date, selected_book)
    @rentals.push(rental)

    puts "Rental created successfully!"
  end

  def list_rentals
    puts "ID of a person:"; id = gets.chomp.to_i
    person_rentals = @rentals.select { |rental| rental.person.id == id }

    if person_rentals.empty?
      puts "No rentals found for person with ID #{id}"
    else
      puts "Rentals:"
      person_rentals.each { |rental| puts "Date: #{rental.date}, Book: #{rental.book.title}, by #{rental.book.author}" }
    end
  end
end
