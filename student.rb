require './person'

# create student class inheret from person class
class Student < Person
  def initialize(classroom)
    super(28, 'Shah Zaman')
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
