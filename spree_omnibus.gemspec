# encoding: UTF-8
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'spree_omnibus/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_omnibus'
  s.version     = SpreeOmnibus::VERSION
  s.summary     = "Spree Commerce Omnibus Extension"
  s.required_ruby_version = '>= 3.0'
  s.license     = 'BSD-3-Clause'

  s.authors    = ['tomaszStrzeszewski23']
  s.email = ['support@cloudsailor.com']
  s.homepage  = 'https://github.com/your-github-handle/spree_omnibus'


  s.files = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*', 'config/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree', '~> 4.10'
  s.add_dependency 'spree_extension'
  s.add_dependency 'deface'

  s.add_development_dependency 'spree_dev_tools'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rspec-retry'
  s.add_development_dependency 'rubocop-rspec'
end
