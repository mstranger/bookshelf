RSpec.xdescribe Web::Views::ApplicationLayout, type: :view do
  # NOTE: https://github.com/hanami/view/issues/129
  #
  # This test will fail when use partials in layout and success otherwise.
  # As far as I understand this question is still open.
  # Instead test root action for example (see: views/home/index_spec.rb)

  let(:flash)      { Hash[] }
  let(:layout)     { Web::Views::ApplicationLayout.new({ format: :html, flash: flash }, 'contents') }
  let(:rendered)   { layout.render }

  it 'contains application name' do
    page_title = 'Bookshelf'
    expect(rendered).to include(page_title)
  end
end
