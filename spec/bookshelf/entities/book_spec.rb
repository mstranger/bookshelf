RSpec.describe Book, type: :entity do
  it 'can be initialized with attributes' do
    book = described_class.new(title: 'Refactoring', author: 'John Doe', user_id: 1)

    expect(book.title).to eq('Refactoring')
    expect(book.author).to eq('John Doe')
    expect(book.user_id).to eq(1)
  end
end
