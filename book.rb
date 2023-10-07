require_relative 'rental'

# cleate book class
class Book
  def initialize(title, auther)
    @title = title
    @auther = auther
    @rental = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  attr_accessor :title, :auther
  attr_reader :rental
end
