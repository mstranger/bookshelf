RSpec.describe Web::Views::Home::Index, type: :view do
  let(:flash)      { Hash[] }
  let(:exposures)  { Hash[format: :html, flash: flash] }
  let(:template)   { Hanami::View::Template.new('apps/web/templates/home/index.html.erb') }
  let(:view)       { described_class.new(template, exposures) }
  let(:rendered)   { view.render }
  let(:page_title) { Web::Views::TITLE }

  it 'exposes #format' do
    expect(view.format).to eq exposures.fetch(:format)
  end

  it 'contains application name' do
    expect(rendered).to include(page_title)
  end

  it 'contains root template' do
    expect(rendered).to include('Index page')
  end

  context 'with navbar partial' do
    it 'contains logo and auth path' do
      logo = %{<a class="navbar-brand logo" href="/">Bookshelf</a>}
      expect(rendered).to include(logo)
      expect(rendered).to include('Sign Up')
      expect(rendered).to include('Sign In')
    end
  end

  context 'with flash_messages partial' do
    let(:notice) { 'Success rendering' }
    let(:alert)  { 'Fail rendering' }

    context 'when success' do
      let(:flash) { Hash[notice: notice] }

      it 'display notice' do
        expect(rendered).to include(notice)
      end
    end

    context 'when fail' do
      let(:flash) { Hash[alert: alert] }

      it 'display alert' do
        expect(rendered).to include(alert)
      end
    end
  end
end
