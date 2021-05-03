RSpec.describe Web::Controllers::Books::Edit, type: :action do
  let(:repo)   { BookRepository.new }
  let(:book)   { repo.last }
  let(:action) { described_class.new }
  let(:params) { Hash[id: book.id] }
  let(:invalid) { Hash[id: book.id + 1] }

  before do
    repo.clear
    repo.create(title: 'TDD', author: 'Keng Beck')
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq(200)
  end

  it 'expose book' do
    action.call(params)
    expect(action.exposures[:book]).to eq(book)
  end

  it 'returns not_found if invalid id' do
    response = action.call(invalid)
    expect(response[0]).to eq(404)
  end
end
