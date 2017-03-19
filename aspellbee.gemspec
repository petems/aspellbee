# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aspellbee/version'

Gem::Specification.new do |gem|
  gem.name          = 'aspellbee'
  gem.version       = Aspellbee::VERSION
  gem.authors       = ['Jack Pearkes', 'Peter Souter', 'Ørjan Blom']
  gem.email         = ['jackpearkes@gmail.com']
  gem.description   = 'A command line tool for interacting with your DigitalOcean droplets.'
  gem.summary       = 'A command line tool for interacting with your DigitalOcean droplets.'
  gem.homepage      = 'https://github.com/pearkes/aspellbee'

  gem.files                 = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.executables           = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files            = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths         = ['lib']
  gem.required_ruby_version = '>= 1.9.2'

  gem.add_dependency 'thor', '0.18.1'
  gem.add_dependency 'ffi-aspell'
  gem.add_dependency 'worte'
  gem.add_dependency 'raspell'
  gem.add_dependency 'middleware', '0.1.0'

  gem.add_development_dependency 'rake', '< 11.0'
  gem.add_development_dependency 'rspec-core', '3.5.4'
  gem.add_development_dependency 'rspec-expectations', '3.5.0'
  gem.add_development_dependency 'rspec-mocks', '3.5.0'
  gem.add_development_dependency 'webmock', '~> 1.11.0'
  gem.add_development_dependency 'simplecov', '0.10'
  gem.add_development_dependency 'simplecov-console', '0.2.0'
  gem.add_development_dependency 'coveralls', '~> 0.6.7'
  gem.add_development_dependency 'aruba', '0.7.4'
  gem.add_development_dependency 'pry', '0.10.4'
  gem.add_development_dependency 'rb-readline', '0.5.3'
  gem.add_development_dependency 'cucumber', '2.0.2'
  gem.add_development_dependency 'rubocop', '0.47.1'       if RUBY_VERSION >= '2.3.0'
  gem.add_development_dependency 'rubocop-rspec', '1.13.0' if RUBY_VERSION >= '2.3.0'

end
