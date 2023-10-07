# frozen_string_literal: true

require_relative 'nameable'
require_relative 'rental'

# create person class
class Person < Nameable
  def initialize(id, age, name: 'Unknown', parent_permission: true, nameable: nil)
    super()
    @id = id
    @name = name
    @age = age
    @nameable = nameable
    @parent_permission = parent_permission
  end

  private

  def of_age
    age >= 18
  end

  def can_use_services
    age >= 18 || parent_permission == true
  end

  def correct_name
    name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  attr_reader :id, :rentals
  attr_accessor :name, :age
end
