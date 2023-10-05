# create person class
class Person
  def initialize(age, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private

  def of_age
    true unless age >= 18
  end

  def can_use_services
    true unless age >= 18 || parent_permission == true
  end

  attr_reader :id
  attr_accessor :name, :age
end
