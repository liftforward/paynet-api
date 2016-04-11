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
require 'support/helper_methods'
require 'pry'

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.before(:suite) do
    PaynetApi::Config.base_url = ENV['BASE_URL']
    PaynetApi::Config.basic_auth_user = ENV['BASIC_AUTH_USER']
    PaynetApi::Config.basic_auth_password = ENV['BASIC_AUTH_PASSWORD']
  end

end
