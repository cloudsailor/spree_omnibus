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
  gem 'database_cleaner', '~> 2.1'
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'observer'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'rspec-rails', '~> 7.1'
  gem 'rspec-retry', '~> 0.6.2'
  gem 'simplecov', '~> 0.22.0'
  gem 'warden'
end

gemspec
