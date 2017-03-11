require 'spec_helper'

describe Aspellbee::Configuration do
  include_context 'spec'

  let(:tmp_path) { project_path + '/tmp/aspellbee' }

  after do
    # Clean up the temp file.
    File.delete(project_path + '/tmp/aspellbee') if File.exist?(project_path + '/tmp/aspellbee')
  end

  it 'is a singleton' do
    expect(described_class).to be_a Class
    expect do
      described_class.new
    end.to raise_error(NoMethodError, %r{private method `new' called})
  end

  it 'has a data attribute' do
    config = described_class.instance
    expect(config.data).to be
  end

  describe 'the file' do
    let(:access_token)       { 'foo' }
    let(:ssh_user)           { 'root' }
    let(:ssh_key_path)       { '~/.ssh/id_rsa2' }
    let(:ssh_port)           { '22' }
    let(:region)             { 'lon1' }
    let(:image)              { 'ubuntu-14-04-x64' }
    let(:size)               { '512mb' }
    let(:ssh_key_id)         { '1234' }
    let(:private_networking) { 'false' }
    let(:backups_enabled)    { 'false' }
    let(:ip6)                { 'false' }

    let(:config) { described_class.instance }

    before do
      # Create a temporary file
      config.create_config_file(locale, suggestion_mode, aspell_mode)
    end

    it 'can be created' do
      expect(File.exist?(tmp_path)).to be_truthy
    end

    it 'can be loaded' do
      data = config.load_config_file
      expect(data).not_to be_nil
    end

    describe 'the file format'
    let(:data) { YAML.load_file(tmp_path) }

    it 'has aspell_config at the top level' do
      expect(data).to have_key('aspell_config')
    end

    it 'has an suggestion mode' do
      aspell_config = data['aspell_config']
      expect(aspell_config).to have_key('locale')
    end

    it 'has an suggestion mode' do
      aspell_config = data['aspell_config']
      expect(aspell_config).to have_key('suggestion_mode')
    end

    it 'has an suggestion mode' do
      aspell_config = data['aspell_config']
      expect(aspell_config).to have_key('mode')
    end
  end
end
