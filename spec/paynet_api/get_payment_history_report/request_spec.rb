describe PaynetApi::GetPaymentHistoryReport::Request do
  subject { PaynetApi::GetPaymentHistoryReport::Request.new(paynet_id: TEST_IDS_FROM_PAYNET[0], payment_comprehensive: "1") }

  describe ".ENDPOINT" do
    it "equals get_payment_history_report.asp" do
      expect(subject::ENDPOINT).to eq("get_payment_history_report.asp")
    end
  end
end
