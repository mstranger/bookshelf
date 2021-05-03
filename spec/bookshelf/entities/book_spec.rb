RSpec.describe Book, type: :entity do
  it 'can be initialized with attributes' do
    book = described_class.new(title: 'Refactoring', author: 'John Doe')

    expect(book.title).to eq('Refactoring')
    expect(book.author).to eq('John Doe')
  end
end
