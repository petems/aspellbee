require 'simplecov'
require 'simplecov-console'
require 'coveralls'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::Console,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start do
  coverage_dir('coverage/')
end

require 'aspellbee'
require 'webmock/rspec'
require 'shared/environment'

RSpec.configure do |config|
  # Pretty tests
  config.color = true

  config.order = :random
end

def project_path
  File.expand_path('../..', __FILE__)
end

def fixture(fixture_name, format = 'json')
  File.new(project_path + "/spec/fixtures/#{fixture_name}.#{format}")
end

ENV['ASPELLBEE_CONFIG_PATH'] = project_path + '/tmp/aspellbee'
