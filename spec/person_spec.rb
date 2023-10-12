require './person'
require './book'
book = Book.new('Harry Potter', 'J.K. Rowling')

describe Person do
  person = Person.new(20, name: 'Mark')

  context 'should create instance of Person Class' do
    it 'returns correct name' do
      expect(person.name).to eq('Mark')
    end

    it 'returns correct age' do
      expect(person.age).to eq(20)
    end

    it 'should return correct data' do
      expect(person.can_use_services?).to eq true
    end
    it 'can rent a book' do
      rental = person.rent_book(book, '12/02/2023')
      expect(person.rentals).to include(rental)
    end
  end
end
