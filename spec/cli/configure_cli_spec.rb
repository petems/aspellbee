require 'spec_helper'

describe Aspellbee::CLI do
  include_context 'spec'

  let(:tmp_path) { project_path + '/tmp/aspellbee' }
  let(:configure_cli_stdout) { "Enter aspell locale (defaults to en_US): Enter aspell suggestion mode (defaults to normal): Enter aspell mode (defaults to html): Configuration is good.\n" }

  describe 'configure' do
    before do
    end

    it 'asks the right questions and checks credentials' do
      expect($stdin).to receive(:gets).and_return('en_UK')
      expect($stdin).to receive(:gets).and_return('fast')
      expect($stdin).to receive(:gets).and_return('email')

      expect { cli.configure }.to output(configure_cli_stdout).to_stdout

      config = YAML.load_file(tmp_path)

      expect(config['aspell_config']['locale']).to eq 'en_UK'
      expect(config['aspell_config']['suggestion_mode']).to eq 'fast'
      expect(config['aspell_config']['mode']).to eq 'email'
    end

    it 'sets defaults if no input given' do
      expect($stdin).to receive(:gets).and_return('en_US')
      expect($stdin).to receive(:gets).and_return('normal')
      expect($stdin).to receive(:gets).and_return('html')

      expect { cli.configure }.to output(configure_cli_stdout).to_stdout

      config = YAML.load_file(tmp_path)

      expect(config['aspell_config']['locale']).to eq 'en_US'
      expect(config['aspell_config']['suggestion_mode']).to eq 'normal'
      expect(config['aspell_config']['mode']).to eq 'html'
    end
  end
end
