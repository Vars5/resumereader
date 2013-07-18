source 'https://rubygems.org'

gem 'rails'

group :production do
  gem 'pg'
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
  gem 'sass-rails'   
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
gem "bootstrap-sass"
gem "bootstrap-will_paginate"
gem 'simple_form'

gem 'aws-sdk'
gem 'paperclip'
gem 'devise-async'
gem "haml"

gem 'figaro'
gem 'newrelic_rpm'

#search engine
gem 'swiftype'
gem 'delayed_job_active_record'
gem 'foreman'

#intercom.io
gem 'intercom-rails', '~> 0.2.21'

#A/B spilt testing
gem 'split', require: 'split/dashboard'

#comments
gem 'acts_as_commentable_with_threading'

