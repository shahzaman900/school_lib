require_relative './person'

# create student class inheret from person class
class Student < Person
  def initialize(id, classroom, age, name = 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
