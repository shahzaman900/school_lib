require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require './data/preservedata '
require './creators'

# create app class
class App
  include Creators
  attr_accessor :rentals, :books, :people

  def initialize
    @rentals = []
    @books = []
    @people = []
  end

  def list_books
    @books = load_data('./data/books.json')
    if @books.empty?
      puts 'No Books'
    else
      @books.each_with_index do |book, i|
        puts "Number: #{i + 1}, Title: #{book[:title]}, Author: #{book[:author]}"
      end
    end
  end

  def list_people
    if @people.empty?
      puts 'No People'
    else
      @people.each_with_index do |person, i|
        puts "No: #{i + 1}, Name: #{person.name},age: #{person.age} ID: #{person.id}"
      end
    end
  end

  def list_rentals
    puts "\n"
    list_people
    puts 'Enter person id:'
    id = gets.chomp.to_i
    @people.each do |person|
      next unless person.id == id

      puts "Name: #{person.name}"
      if person.rentals.empty?
        puts 'Has no rentals'
      else
        person.rentals.each do |rental|
          puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
        end
      end
    end
  end
end
