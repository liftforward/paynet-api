require 'bundler/setup'
Bundler.setup

require 'dotenv'
Dotenv.load

require 'rspec/matchers' # req by equivalent-xml custom matcher `be_equivalent_to`
require 'equivalent-xml'
require 'rspec/collection_matchers'
require 'paynet_api' # and any other gems you need
require 'hashie' # and any other gems you need
require 'rspec/its'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
  c.configure_rspec_metadata!
  c.allow_http_connections_when_no_cassette = true
end

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
end
