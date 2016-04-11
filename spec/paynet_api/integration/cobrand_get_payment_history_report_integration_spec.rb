require "paynet_api"
require "awesome_print"

describe "Paynet API Integration", :slow, :integration do
  let(:client) { PaynetApi::Client.new }
  let(:test_id_from_paynet) { "59206906" }

  context "when Paynet API returns results" do
    subject { client.cobrand_get_payment_history_report(paynet_id: test_id_from_paynet, payment_comprehensive: "1") }

    it { is_expected.to be_success }
    its(:pdf) { is_expected.not_to be_nil }
    its(:content_type) { is_expected.to eq("application/pdf") }
  end

  context "Paynet API returns error" do
    subject { client.cobrand_get_payment_history_report(paynet_id: 1234567890, payment_comprehensive: "1") }

    it { is_expected.not_to be_success }
    its(:pdf) { is_expected.to eq("<p>PayNet Error: paynet_id not found - 1234567890</p>") }
    its(:content_type) { is_expected.to eq("text/html; charset=utf-8") }
  end
end
