RSpec.describe Web::Views::Users::Index, type: :view do
  let(:exposures) { Hash[users: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/users/index.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes users' do
    expect(view.users).to eq(exposures.fetch(:users))
  end

  it 'shows add new user button' do
    expect(rendered).to include('<a class="btn btn-primary" href="/users/new">Add new user</a>')
  end

  context 'when there are users' do
    let(:user1)     { User.new(email: 'sample1@mail.com') }
    let(:user2)     { User.new(email: 'sample2@mail.com') }
    let(:exposures) { Hash[users: [user1, user2], params: []] }

    it 'lists them all' do
      expect(rendered.scan(/class="user"/).length).to eq(2)
      expect(rendered).to include(user1.email)
      expect(rendered).to include(user2.email)
    end
  end
end
