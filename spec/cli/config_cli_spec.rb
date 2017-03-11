require 'spec_helper'

describe Aspellbee::CLI do
  include_context 'spec'

  describe 'config' do
    it 'shows the full config' do
      foo = <<-eos
Current Config\x20
Path: #{Dir.pwd}/tmp/aspellbee
---
aspell_config:
  locale: en_UK
  suggestion_mode: fast
  mode: html
      eos

      expect { cli.config }.to output(foo).to_stdout
    end
  end
end
