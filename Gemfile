source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.3'
gem 'hanami-model', '~> 1.3'

gem 'sqlite3'

group :development do
  gem 'shotgun', platforms: :ruby
  gem 'hanami-webconsole'
end

group :test, :development do
  gem 'dotenv', '~> 2.4'
  gem 'byebug' # for debugging
end

group :test do
  gem 'rspec'
  gem 'capybara'
end

group :production do
  # gem 'puma'
end
