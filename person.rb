require './nameable'

# create person class
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @parent_permission = parent_permission
    @name = name
    @age = age
    @id = Random.rand(1..100)
    @rentals = []
  end

  def rent_book(book, date)
    Rental.new(date, book, self)
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    name
  end

  def to_h
    {
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      rentals: @rentals.map(&:to_h)
    }
  end

  private

  def of_age?
    @age >= 18
  end
end
