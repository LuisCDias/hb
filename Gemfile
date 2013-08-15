source 'https://rubygems.org'

ruby '2.0.0'

gem 'airbrake'
gem 'aws-sdk', '~> 1.5.7'
gem 'coffee-rails'
gem 'delayed_job_active_record', '>= 4.0.0.beta2'
gem 'devise'
gem 'email_validator'
gem 'figaro'
gem 'flutie'
gem 'font-awesome-rails'
gem 'fontello-rails', git: 'git://github.com/pedrosmmoreira/fontello-rails.git'
gem 'high_voltage'
gem 'jquery-rails'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'paperclip'
gem 'pg'
gem 'rack-timeout'
gem 'rails', '>= 4.0.0'
gem 'recipient_interceptor'
gem 'sass-rails'
gem 'simple_form'
gem 'soundcloud'
gem 'uglifier'
gem 'unicorn'
gem 'will_paginate', '~>3.0'

group :development do
  gem 'foreman'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails', '>= 2.14'
end

group :test do
  gem 'capybara-webkit', '>= 0.14.1'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
end

group :staging, :production do
  gem 'newrelic_rpm', '>= 3.5.7'
  gem 'rails_12factor'
end
