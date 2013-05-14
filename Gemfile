source 'https://rubygems.org'

gem 'rails', '3.2.8'

gem 'pg'
gem 'foreigner'

gem 'jquery-rails'
gem 'haml-rails'

gem 'russian'

gem 'carrierwave'
gem 'mini_magick' # производительнее и кушает меньше памяти

gem 'kaminari'
gem 'simple-navigation'

gem 'validates_existence'

gem 'resque'
gem 'carrierwave_backgrounder'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'sass-rails', '~> 3.2.3'
  gem 'uglifier', '>= 1.0.3'
end

group :linux do
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
end

group :tests do
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'faker'
  gem 'database_cleaner'
  gem 'rspec-resque'
end

group :development, :tests do
  # Эти гемы должны быть как в test, так и в development
  # постольку поскольку они имеют генераторы
  # соотв. для спеков и фабрик.
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end
