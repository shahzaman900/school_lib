require './book'
require './person'
require './rental'

describe Book do
  book = Book.new('Harry Potter', 'J.K. Rowling')

  context 'should create an instance of the Book class' do
    it 'returns the correct title' do
      expect(book.title).to eq('Harry Potter')
    end

    it 'returns the correct author' do
      expect(book.author).to eq('J.K. Rowling')
    end

    it 'can add a rental' do
      person = Person.new(20, name: 'Alice')
      rental = book.add_rental(person, '12/02/2023')
      expect(book.rentals).to include(rental)
    end
  end
end
