require './teacher'

describe Teacher do
  teacher = Teacher.new(45, 'Codding', name: 'zaman')

  context 'This shoukd return teacher details' do
    it 'This should return teacher age ' do
      expect(teacher.age).to eq(45)
    end
    it 'This should return teacher can_use_services ' do
      expect(teacher.can_use_services).to eq(true)
    end
    it 'This should return teacher name ' do
      expect(teacher.name).to eq('zaman')
    end
  end
end
