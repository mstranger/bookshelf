RSpec.describe Web::Views::Books::Index, type: :view do
  let(:exposures) { Hash[books: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/books/index.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #books' do
    expect(view.books).to eq(exposures.fetch(:books))
  end

  context 'when there are no books' do
    it 'shows a placeholder message' do
      expect(rendered).to include('<p class="placeholder alert-info p-4">There are no books yet.</p>')
    end
  end

  context 'when there are books' do
    let(:book1)     { Book.new(id: 1, title: 'Refactoring', author: 'Martin Fowler') }
    let(:book2)     { Book.new(id: 2, title: 'Domain Driven Design', author: 'Eric Evans') }
    let(:exposures) { Hash[books: [book1, book2], params: []] }

    it 'lists them all' do
      expect(rendered.scan(/class="book"/).length).to eq(2)
      expect(rendered).to include('Refactoring')
      expect(rendered).to include('Domain Driven Design')
    end

    it 'hides the placeholder message' do
      expect(rendered).not_to include('<p class="placeholder">There are no books yet.</p>')
    end
  end
end
