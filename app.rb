require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'

# create app class
class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_people
    @people.each do |person|
      puts "[#{person.class.name}] Name:#{person.name} ID:#{person.id} Age:#{person.age}"
    end
  end

  def create_person
    puts "\nCreate a person (1) Student or (2) Teacher?"
    option = gets.chomp.to_i

    print 'Age:'
    age = gets.chomp.to_i
    print 'Name:'
    name = gets.chomp

    case option
    when 1
      create_student(age, name)
    when 2
      create_teacher(age, name)
    else
      puts 'Invalid option.'
    end
  end

  def create_student(age, name)
    if age < 18
      print 'Has parent permission? [Y/N]:'
      permission = gets.chomp
    end
    person = Student.new(age, name, parent_permission: permission)
    type = 'Student'

    @people.push(person)
    puts "#{type} created successfully!"
  end

  def create_teacher(age, name)
    print 'Specialization:'
    specialization = gets.chomp
    person = Teacher.new(specialization, age, name)
    type = 'Teacher'
    @people.push(person)
    puts "#{type} created successfully!"
  end

  def create_book
    print 'Author:'
    author = gets.chomp
    print 'Title:'
    title = gets.chomp
    print 'Book created successfully!'
    book = Book.new(title, author)
    @books.push(book)
  end

  # def create_rental
  #   if @people.length.positive?
  #     puts 'Please select a person from the list below by a number (and not the id):'
  #     @people.each_with_index do |person, index|
  #       puts "#{index + 1}. [#{person.class.name}] Name: #{person.name} ID: #{person.id} Age: #{person.age}"
  #     end
  #     person_choice = gets.chomp.to_i

  #   else
  #     puts 'No people added to the list'
  #   end

  #   if @books.length.positive?
  #     puts 'Please select the book from the list below by a number:'
  #     @books.each_with_index do |book, index|
  #       puts "#{index + 1}. Title: \"#{book.title}\", Author: #{book.author}"
  #     end
  #     book_choice = gets.chomp.to_i
  #   else
  #     puts 'No books added to the list'
  #     return
  #   end

  #   print 'Date (YYYY/MM/DD): '
  #   date = gets.chomp
  #   selected_person = @people[person_choice - 1]
  #   selected_book = @books[book_choice - 1]

  #   rental = selected_person.add_rental(date, selected_book)
  #   @rentals.push(rental)
  #   puts 'Rental created successfully!'
  # end

  def create_rental
    if @people.length.zero?
      puts 'No people added to the list'
      return
    end

    select_person
    return if @selected_person.nil?

    if @books.length.zero?
      puts 'No books added to the list'
      return
    end

    select_book
    return if @selected_book.nil?

    get_rental_date

    rental = @selected_person.add_rental(@date, @selected_book)
    @rentals.push(rental)
    puts 'Rental created successfully!'
  end

  def select_person
    puts 'Please select a person from the list below by a number (and not the id):'
    @people.each_with_index do |person, index|
      puts "#{index + 1}. [#{person.class.name}] Name: #{person.name} ID: #{person.id} Age: #{person.age}"
    end
    person_choice = gets.chomp.to_i
    @selected_person = @people[person_choice - 1]
  end

  def select_book
    puts 'Please select the book from the list below by a number:'
    @books.each_with_index do |book, index|
      puts "#{index + 1}. Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_choice = gets.chomp.to_i
    @selected_book = @books[book_choice - 1]
  end

  def get_rental_date
    print 'Date (YYYY/MM/DD): '
    @date = gets.chomp
  end


  def list_rentals
    puts 'ID of a person:'
    id = gets.chomp.to_i
    person_rentals = @rentals.select { |rental| rental.person.id == id }

    if person_rentals.empty?
      puts "No rentals found for person with ID #{id}"
    else
      puts 'Rentals:'
      person_rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title}, by #{rental.book.author}"
      end
    end
  end
end
