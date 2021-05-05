source 'https://rubygems.org'

gem 'rake',         '~> 13.0'
gem 'hanami',       '~> 1.3'
gem 'hanami-model', '~> 1.3'

gem 'sqlite3',      '~> 1.4'

group :development do
  gem 'shotgun', platforms: :ruby
  gem 'hanami-webconsole'
end

group :test, :development do
  gem 'dotenv', '~> 2.4'
  gem 'byebug'
end

group :test do
  gem 'rspec',    '~> 3.10'
  gem 'capybara', '~> 3.35'
end

group :production do
  # gem 'puma'
end
