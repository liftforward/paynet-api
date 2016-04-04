require "paynet_api"
require "awesome_print"

describe "Paynet API Integration", :slow, :integration do

  before do
    PaynetApi::Config.base_url = ENV['BASE_URL']
    PaynetApi::Config.basic_auth_user = ENV['BASIC_AUTH_USER']
    PaynetApi::Config.basic_auth_password = ENV['BASIC_AUTH_PASSWORD']
  end

  let(:client) { PaynetApi::Client.new }

  context "Paynet API returns results" do
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
    its(:parsed_xml) { is_expected.to be_a(Hashie::Mash) }
    its(:companies) { is_expected.not_to be_empty }
  end

  context "Paynet API returns not results" do
    let(:business) {{
      company_name: "qqqqqq",
      address: "",
      city: "Norwich",
      state_code: "NY",
      # tax_id: nil
      # company_name_alias: nil,
      # name_match_threshold: nil,
      # phone: nil ,
    }}

    subject { client.search_for_company(business) }

    it { is_expected.to be_success }

    its(:parsed_xml) { is_expected.to be_a(Hashie::Mash) }
    its(:companies) { is_expected.to be_empty }
  end

  context "Paynet API returns error" do
    let(:business) {{
      company_name: "q",
      address: "",
      city: "Norwich",
      state_code: "NY",
      # tax_id: nil
      # company_name_alias: nil,
      # name_match_threshold: nil,
      # phone: nil ,
    }}

    subject { client.search_for_company(business) }

    it { is_expected.not_to be_success }

    its(:parsed_xml) { is_expected.to be_a(Hashie::Mash) }
    its(:companies) { is_expected.to be_empty }
  end

  # context "Paynet API returns 1 item", :focus do
  #   let(:business) {{
  #     company_name: "quay",
  #     address: "377 HOOPER ST",
  #     city: "BROOKLYN",
  #     state_code: "NY",
  #     postal_code: "11211-5809"
  #     # tax_id: nil
  #     # company_name_alias: nil,
  #     # name_match_threshold: nil,
  #     # phone: nil ,
  #   }}

  #   subject { client.search_for_company(business) }

  #   it { is_expected.not_to be_success }

  #   it { ap subject.parsed_xml }
  #   its(:parsed_xml) { is_expected.to be_a(Hashie::Mash) }
  #   its(:companies) { is_expected.to have(1).items }
  # end
end
