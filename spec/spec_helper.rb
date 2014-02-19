require 'rspec'
require 'webmock/rspec'
require 'vcr'
require 'meeting_finder'
require 'faraday'
require 'json'

RSpec.configure do |config|
  config.color_enabled = true
end

VCR.configure do |c|
  c.cassette_library_dir = "spec/vcr"
  c.hook_into :webmock
end
