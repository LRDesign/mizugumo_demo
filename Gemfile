source 'http://rubygems.org'

gem 'rails', '3.0.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem "haml"
gem 'mizugumo'

group :production do
  gem 'mysql'
end

group :development, :test do
  gem "sqlite3-ruby", :require => 'sqlite3'
  gem "rspec", ">= 2.4.0"
  gem "rspec-rails", ">= 2.4.0"
  gem "factory_girl_rails"
  gem 'ruby-debug'
  gem 'webrat'
end

group :test do
  gem 'mongrel'
end