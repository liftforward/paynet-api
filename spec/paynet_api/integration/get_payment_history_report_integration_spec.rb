require "paynet_api"
require "awesome_print"

describe "Paynet API Integration", :slow, :integration do
  let(:client) { PaynetApi::Client.new }
  let(:test_id_from_paynet) { "59206906" }

  context "Paynet API returns results" do
    subject { client.get_payment_history_report(paynet_id: test_id_from_paynet, payment_comprehensive: "1") }

    it { is_expected.to be_success }
    its(:parsed_xml) { is_expected.to be_a(Hashie::Mash) }
  end

  context "Paynet API returns error" do
    subject { client.get_payment_history_report(paynet_id: 1234567890, payment_comprehensive: "1") }

    it { is_expected.not_to be_success }
    its(:parsed_xml) { is_expected.to be_a(Hashie::Mash) }
  end
end
