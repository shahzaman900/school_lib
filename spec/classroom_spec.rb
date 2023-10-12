require './classroom'
require './student'

describe Classroom do
  classroom = Classroom.new('Math')
  student = Student.new(23, name: 'Shahzaman', parent_permission: true)
  context 'should create an instance of Classroom Class' do
    it 'returns correct label' do
      expect(classroom.label).to eq('Math')
    end

    it 'can add a student to the classroom' do
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
