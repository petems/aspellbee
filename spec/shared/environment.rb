require 'spec_helper'

shared_context 'spec' do
  # Default configuration and
  let(:config)             { Aspellbee::Configuration.instance }
  let(:locale)             { 'en_UK' }
  let(:suggestion_mode)    { 'fast' }
  let(:aspell_mode)        { 'html' }
  let(:app)                { ->(env) {} }
  let(:env)                { {} }
  let(:cli)                { Aspellbee::CLI.new }

  before do
    # Set a temprary project path and create fake config.
    config.create_config_file(locale, suggestion_mode, aspell_mode)
    config.reload!
  end

  after do
    #
  end

  after do
    # Delete the temporary configuration file if it exists.
    File.delete(project_path + '/tmp/aspellbee') if File.exist?(project_path + '/tmp/aspellbee')
  end
end
