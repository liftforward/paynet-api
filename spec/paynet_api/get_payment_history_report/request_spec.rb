describe PaynetApi::GetPaymentHistoryReport::Request do
  let(:test_id_from_paynet) { "59206906" }

  subject { PaynetApi::GetPaymentHistoryReport::Request.new(paynet_id: test_id_from_paynet, payment_comprehensive: "1") }

  describe ".ENDPOINT" do
    it "equals get_payment_history_report.asp" do
      expect(subject.class::ENDPOINT).to eq("get_payment_history_report.asp")
    end
  end
end
