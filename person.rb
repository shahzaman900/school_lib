require_relative './nameable'

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

  attr_reader :id
  attr_accessor :name, :age
end
