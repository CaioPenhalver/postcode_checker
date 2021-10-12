# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'oj'
gem 'will_paginate', '~> 3.1.1'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'typhoeus'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'rubocop', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'rspec-rails', '~> 3.4'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'simplecov', require: false
  gem 'webdrivers'
  gem 'webmock'
end
