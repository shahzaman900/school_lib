require './student'

describe Student do
  student = Student.new(23, name: 'Shahzaman', parent_permission: true)

  context 'this should return student details' do
    it 'this shoukd return age' do
      expect(student.age).to eq(23)
    end
    it 'this shoukd return name' do
      expect(student.name).to eq('Shahzaman')
    end
    it 'this shoukd return play hooky data' do
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end
end
