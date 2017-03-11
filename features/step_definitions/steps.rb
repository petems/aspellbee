require 'erb'

Given(%r{^a '\.aspellbee' config with data:$}) do |data_str|
  data = ERB.new(data_str).result(binding)
  File.write("#{Dir.pwd}/tmp/aruba/.aspellbee", data)
end
