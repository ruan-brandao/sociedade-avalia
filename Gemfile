source 'https://rubygems.org'

gem 'rails', '4.1.4'
ruby "2.1.2"

group :development do
	gem 'sqlite3'
end

group :production do
	gem 'pg'
	gem 'rails_12factor'
	gem 'mandrill-api'
end

gem 'sidekiq'
gem 'devise-async'

gem 'sass-rails', '~> 4.0.0'
gem 'bootstrap-sass', '~> 3.1.1'
gem 'font-awesome-rails'

gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.0.0'

gem 'jquery-rails'

gem 'turbolinks'

gem 'puma'

gem 'jbuilder', '~> 1.2'

gem 'devise'

gem "paperclip", "~> 4.1"

gem 'railroady'

gem 'sweet-alert-confirm'
gem 'sweet-alert'

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'rspec-its'
  gem 'factory_girl_rails'
  gem 'capybara'
end

group :test do
	gem 'shoulda-matchers'
	gem 'cucumber-rails', require: false
	gem 'database_cleaner'
	gem 'selenium-webdriver'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
