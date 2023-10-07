require_relative 'person'
require_relative 'classroom'

# create student class inheret from person class
class Student < Person
  def initialize(id, classroom, age, name = 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  attr_reader :classroom

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
