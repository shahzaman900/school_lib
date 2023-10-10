# frozen_string_literal: true

# create classroom class
class Classroom
  def initialize(label)
    @label = label
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end

  attr_accessor :label
  attr_reader :students
end
