require_relative '../../shared_variables'

RSpec.describe Web::Views::Home::Index, type: :view do
  let(:flash)     { Hash[] }
  let(:env)       { Hash['REQUEST_PATH': '/'] }
  let(:params)    { OpenStruct.new(env: env) }
  let(:exposures) { Hash[format: :html, flash: flash, params: params] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/home/index.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    expect(view.format).to eq exposures.fetch(:format)
  end

  it 'contains application name' do
    page_title = Web::Views::TITLE
    expect(rendered).to include(page_title)
  end

  it 'contains root template' do
    expect(rendered).to include('Index page')
  end

  context 'with navbar partial' do
    it 'contains logo and auth path' do
      logo = %(<a class="navbar-brand logo" href="/">Bookshelf</a>)
      expect(rendered).to include(logo)
      expect(rendered).to include('Sign Up')
      expect(rendered).to include('Sign In')
    end
  end

  context 'with flash_messages partial' do
    include_context 'shared variables'

    context 'when success' do
      let(:flash) { Hash[notice: flash_notice] }

      it 'display notice' do
        expect(rendered).to include(flash_notice)
      end
    end

    context 'when fail' do
      let(:flash) { Hash[alert: flash_alert] }

      it 'display alert' do
        expect(rendered).to include(flash_alert)
      end
    end
  end
end
