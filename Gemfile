source 'https://rubygems.org'

ruby '2.0.0'

gem 'coffee-rails'
gem 'delayed_job_active_record', '>= 4.0.0.beta2'
gem 'delayed_job_web'
gem 'devise'
gem 'flutie'
gem 'font-awesome-rails'
gem 'fontello-rails', git: 'git://github.com/pedrosmmoreira/fontello-rails.git'
gem 'high_voltage'
gem 'jquery-rails'
gem 'jquery-migrate-rails'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'pg'
gem 'rack-timeout'
gem 'rails', '>= 4.0.0'
gem 'rails-observers'
gem 'recipient_interceptor'
gem 'sass-rails'
gem 'simple_form'
gem 'soundcloud'
gem 'uglifier'
gem 'unicorn'
gem 'will_paginate', '~>3.0'
gem 'google-analytics-rails'


group :development do
  gem 'foreman'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '>= 2.14'
  gem 'sinatra', require: false
end

group :test do
  gem 'capybara-webkit', '>= 0.14.1', require: false
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
