require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'

module Creators
    def create_person
        puts "\n"
        puts 'Do you want to create a student (1) or teacher (2)?:'
        type = gets.chomp.to_i
        puts 'Enter person age:'
        age = gets.chomp.to_i
        puts 'Enter person name:'
        name = gets.chomp
        if type == 1
          puts 'Has parent permission? [Yes/No]'
          has_parent_permission = gets.chomp
          create_student(age, name, has_parent_permission)
        elsif type == 2
          puts 'Enter specialization'
          specialization = gets.chomp
          create_teacher(age, specialization, name)
        else
          puts 'Invalid input'
        end
      end
    
      def create_student(age, name, parent_permission)
        student = Student.new(age, name: name, parent_permission: parent_permission)
        @people << student
        puts '------------Student created succesfully----------'
      end
    
      def create_teacher(age, name, specialization)
        teacher = Teacher.new(age, specialization, name: name)
        @people << teacher
        puts '-----------Teacher created succesfully----------'
      end
    
      def create_book
        puts "\n"
        puts 'Enter book title:'
        title = gets.chomp
        puts 'Enter book author:'
        author = gets.chomp
        book = Book.new(title, author)
        @books << book
        puts '-------Book added succesfully--------'
      end
    
      def create_rental
        puts "\n"
        puts 'Enter rental date:'
        date = gets.chomp
        list_books
        puts 'Enter book number:'
        book = gets.chomp.to_i
        list_people
        puts 'Enter person number:'
        person = gets.chomp.to_i
        rental = Rental.new(date, books[book - 1], people[person - 1])
        @rentals << rental
      end
end