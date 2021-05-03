RSpec.describe Web::Views::Books::Show, type: :view do
  let(:user)      { UserRepository.new.create(email: 'some@mail.com') }
  let(:book)      { Book.new(user_id: user.id, title: 'Sample', author: 'John Doe') }
  let(:exposures) { Hash[book: book] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/books/show.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #book' do
    expect(view.book).to eq(exposures.fetch(:book))
  end

  it 'shows the book' do
    expect(rendered.scan(/class="book"/).length).to eq(1)
    expect(rendered).to include('Sample')
    expect(rendered).to include('John Doe')
  end

  it 'hides the placeholder' do
    expect(rendered).not_to include('Book not found.')
  end
end
