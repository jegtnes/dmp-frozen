source 'https://rubygems.org'

gem 'rails', '4.0.4'

gem 'unicorn'
gem 'sqlite3'
gem 'rake', '10.2.2'

# Preprocessing
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'guard', '>= 2.2.2',       require: false
  gem 'guard-livereload',        require: false
  gem 'rack-livereload'
  gem 'rb-fsevent',              require: false
  gem 'capistrano'
  gem 'capistrano-rbenv',        github: 'capistrano/rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
end

group :development, :production do
  gem 'dotenv-rails'
end

# Assets
gem 'polar-express' # inuit.css
gem 'twitter-typeahead-rails'
gem 'jquery-rails'
