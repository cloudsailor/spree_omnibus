# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

spree_opts = '< 5.0.0'
gem 'abbrev'
gem 'byebug'
gem 'deface'
gem 'pg'
gem 'redis', '>= 4.0.1'
gem 'spree', spree_opts
gem 'spree_backend', '< 5.0.0'
gem 'spree_emails', '~> 4.10', '>= 4.10.1'
gem 'sqlite3', '>= 2.0'

group :test do
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'observer'
end

gemspec
