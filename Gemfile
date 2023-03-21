source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', "~> 5.2"
# Use MySQL as the database for Active Record
gem 'mysql2', '~> 0.4.0'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',        group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',      group: :development

gem 'pry-rails',   group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'bootstrap-sass'
gem 'bootswatch-rails' # bootstrap themes ;)
gem 'puma'
gem 'rack-cache', :require => 'rack/cache'

gem "alchemy_cms", "~> 4.5.0"
gem "alchemy-devise", "~> 4.5.0"
gem "alchemy_i18n"

group :test do
  gem 'rspec-rails'
end

group :development do
  gem "capistrano", "~> 3.0", require: false
  gem 'capistrano-uberspace', git: 'https://github.com/mamhoff/capistrano-uberspace', branch: 'uberspace-7', require: false
  gem 'capistrano-alchemy', git: "https://github.com/AlchemyCMS/capistrano-alchemy", branch: "master", require: false
  gem "ed25519"
  gem "bcrypt_pbkdf"
end
