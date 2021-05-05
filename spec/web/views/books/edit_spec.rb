RSpec.describe Web::Views::Books::Edit, type: :view do
  let(:user)      { UserRepository.new.create(email: 'some@mail.com') }
  let!(:book)     { Book.new(id: 1, user_id: user.id, title: 'Sample', author: 'John Doe') }
  let(:exposures) { Hash[book: book, params: params] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/books/edit.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  context 'when no errors' do
    let(:params) { OpenStruct.new(valid?: true) }

    it 'shows form filled with book attributes' do
      expect(rendered).to include(book.title)
      expect(rendered).to include(book.author)
    end
  end

  context 'when has error messages' do
    let(:params) { OpenStruct.new(valid?: false, error_messages: ['Title must be filled', 'Author must be filled']) }

    it 'displays this errors' do
      expect(rendered).to include('There was a problem with your submission')
      expect(rendered).to include('Title must be filled')
      expect(rendered).to include('Author must be filled')
    end
  end
end
