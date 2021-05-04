RSpec.describe Web::Views::Users::New, type: :view do
  let(:params)    { OpenStruct.new(valid?: false, error_messages: ['Email is required']) }
  let(:exposures) { Hash[params: params] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/users/new.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'displays list of errors when params contains errors' do
    expect(rendered).to include('Email is required')
  end
end
