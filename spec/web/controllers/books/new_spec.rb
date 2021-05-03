RSpec.describe Web::Controllers::Books::New, type: :action do
  let(:action)    { described_class.new }
  let(:params)    { Hash[] }
  let!(:response) { action.call(params) }

  it 'is successful' do
    expect(response[0]).to eq 200
  end
end
