require 'spec_helper'

describe Aspellbee::CLI do
  include_context 'spec'

  describe 'help' do
    it 'shows a help message' do
      expect { cli.help }.to output(/To learn more or to contribute, please see github.com\/petems\/aspellbee/).to_stdout
    end

    it 'shows a help message for specific commands' do
      expect { cli.help 'config' }.to output(%r{This shows the current information in the .aspellbee config being used by the app}).to_stdout
    end
  end
end
