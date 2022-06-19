# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'
gem 'rails', '~> 7.0.2', '>= 7.0.2.3'

# default
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sprockets-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# not default
gem 'bcrypt'
gem 'jsbundling-rails'
gem 'redis'
gem 'stimulus-rails'
gem 'tailwindcss-rails'
gem 'turbo-rails'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  # not default
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
end

group :test do
  gem 'rspec-rails'
end
