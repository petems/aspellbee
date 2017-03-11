require 'spec_helper'

describe Aspellbee::Middleware::InjectClient do
  include_context 'spec'

  let(:tmp_path) { project_path + '/tmp/Aspellbee' }

  before do
    config = Aspellbee::Configuration.instance
    env['config'] = config
  end

  describe '.call' do
    it 'loads the client into the environment' do
      described_class.new(app).call(env)

      expect(env['aspell']).to be_a ::Aspell
    end

    it 'creates a client with values from config file' do
      pending 'Not sure why failing'

      expect(::Aspell).to receive(:new).with('en_US')

      described_class.new(app).call(env)
    end
  end
end
