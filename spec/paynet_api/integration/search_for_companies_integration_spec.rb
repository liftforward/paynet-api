require "paynet_api"

describe "Paynet API Integration", :slow, :integration do

  # before {
  #   PaynetApi::Config.base_url = ENV['BASE_URL']
  #   PaynetApi::Config.basic_auth_user = ENV['BASIC_AUTH_USER']
  #   PaynetApi::Config.basic_auth_password = ENV['BASIC_AUTH_PASSWORD']
  #   # PaynetApi::Config.proxy_url = ENV['']
  #   # PaynetApi::Config.log = ENV['']
  #   # PaynetApi::Config.log_level = ENV['']
  # }

  let(:client) { PaynetApi::Client.new }

  context "desired business exists in Paynet API", :vcr do
    let(:business) {{
      company_name: "google",
      address: "76 9th Ave",
      city: "New York",
      state_code: "NY",
      # tax_id: nil
      # company_name_alias: nil,
      # name_match_threshold: nil,
      # phone: nil ,
    }}

    subject { client.search_for_company(business) }

    it { is_expected.to be_success }
    its(:companies) { is_expected.not_to be_nil }
  end

end
