require "paynet_api"
require "awesome_print"

describe "Paynet API Integration", :slow, :integration do
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
end
