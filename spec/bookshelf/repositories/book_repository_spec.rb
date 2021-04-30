RSpec.describe BookRepository, type: :repository do
  let(:repo) { described_class.new }

  before { repo.clear }

  it 'is empty' do
    expect(repo.all.count).to eq(0)
  end
end
