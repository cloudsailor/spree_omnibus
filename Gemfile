source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails-controller-testing'

spree_opts = '< 5.0.0'
gem 'abbrev'
gem 'mysql2' if ENV['DB'] == 'mysql' || ENV['CI']
gem 'pg'
gem 'redis', '>= 4.0.1'
gem 'spree', spree_opts
gem 'spree_backend', '< 5.0.0'

gemspec
