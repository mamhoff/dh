source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', "~> 7.0.0"
# Use MySQL as the database for Active Record
gem 'mysql2'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

gem 'jsbundling-rails'

gem 'pry-rails',   group: :development

gem 'bootstrap-sass'
gem 'bootswatch-rails' # bootstrap themes ;)
gem 'puma'
gem 'rack-cache', :require => 'rack/cache'

gem "alchemy_cms", "~> 6.1.0"
gem "alchemy-devise", "~> 6.1.0"

group :test do
  gem 'rspec-rails'
end

group :development do
  gem "capistrano", "~> 3.0", require: false
  gem 'capistrano-uberspace', git: 'https://github.com/mamhoff/capistrano-uberspace', branch: 'uberspace-7', require: false
  gem 'capistrano-alchemy', git: "https://github.com/AlchemyCMS/capistrano-alchemy", branch: "master", require: false
  gem 'capistrano-yarn'
  gem "ed25519"
  gem "bcrypt_pbkdf"
  gem "listen"
end
