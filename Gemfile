source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

gem 'commonjs', '~> 0.2.7'
gem 'less-rails'
gem 'underscore-rails'



gem 'font-awesome-less'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

#See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'mongoid', '~> 4.0.0.alpha1', github: 'mongoid/mongoid'
gem 'bson_ext'

# for rabl render json
gem 'rabl'
gem 'oj'
gem 'aasm'

#image uploader
gem 'carrierwave'

# cancan is used for user authorize.
gem 'cancan'

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', require: 'bcrypt'


group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'capistrano-unicorn', require: false
  gem 'quiet_assets'
end

group :test do
  gem 'mongoid-rspec'
  gem 'jekyll'
  gem 'selenium-webdriver'
  gem 'rubyzip', require: 'zip/zip'
  gem 'zip-zip'
  gem 'gizmo'
  gem 'term-ansicolor'
  gem 'brakeman', '~> 2.2.0'
end

group :development, :test do
  gem 'pry'
  gem 'rspec-rails', '~> 2.0'
  gem 'teaspoon'
  gem 'jasmine'
  gem 'awesome_print'
  gem 'simplecov', :require => false
  gem 'markaby'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
