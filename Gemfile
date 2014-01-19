source 'http://rubygems.org'

gem 'rails'

group :production do
  gem 'pg'
  gem 'rmagick', '~> 2.13.2'
end

group :development, :test do
   gem 'sqlite3'
   gem 'rspec-rails'
   gem 'guard-rspec'
   gem 'letter_opener' #email testing in development
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :test do
  gem 'capybara', '1.1.2'
  gem 'rb-fsevent', '0.9.1', :require => false
  gem 'growl', '1.0.3'
end

gem 'jquery-rails'
gem "heroku"

#user registrations, invitations & authorizations
gem "devise"
gem "devise_invitable"
gem "cancan"

#styling
gem 'foundation-rails'
gem 'will_paginate', '~> 3.0'
gem 'simple_form'

#upload
gem 'aws-sdk'
gem 'paperclip'
gem 'paperclip-aws'


gem 'devise-async'
gem "haml"

gem 'figaro'
gem 'newrelic_rpm'


#intercom.io
gem 'intercom-rails', '~> 0.2.21'

#A/B spilt testing
gem 'split', require: 'split/dashboard'

#comments
gem 'acts_as_commentable_with_threading'

gem 'acts_as_votable', '~> 0.7.1'

#For API
gem 'rocket_pants', '~> 1.0'
